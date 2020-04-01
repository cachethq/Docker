FROM php:7.1-fpm-alpine

LABEL maintainer="Alt Three <support@alt-three.com>"

# entrypoint.sh dependencies
RUN apk add --no-cache \
	bash \
	nginx \
	mysql-client \
	postgresql-client \
	supervisor

# Install PHP extensions
RUN set -eux; \
	\
	apk add --no-cache --virtual .build-deps \
		$PHPIZE_DEPS \
		libjpeg-turbo-dev \
		libmcrypt-dev \
		libmemcached-dev \
		libpng-dev \
		openldap-dev \
		pcre-dev \
		postgresql-dev \
		sqlite-dev \
	; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install \
		gd \
		mysqli \
		opcache \
		pdo_mysql \
		pdo_pgsql \
		pdo_sqlite \
		pgsql \
		zip \
	; \
	\
# pecl will claim success even if one install fails, so we need to perform each install separately
	pecl install APCu-5.1.17; \
	pecl install redis-4.3.0; \
	\
	docker-php-ext-enable \
		apcu \
		redis \
	; \
	\
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
	apk add --virtual .postfixadmin-phpexts-rundeps $runDeps; \
	apk del .build-deps

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

#VOLUME /var/www/html
ENV COMPOSER_VERSION 1.9.0

# Install composer
RUN set -eux; \
	curl -fsSL https://getcomposer.org/installer -o /tmp/composer-setup.php; \
	curl -fsSL https://composer.github.io/installer.sig -o /tmp/composer-setup.sig; \
	php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"; \
	php /tmp/composer-setup.php --version=$COMPOSER_VERSION --install-dir=/bin; \
	php -r "unlink('/tmp/composer-setup.php');"

ARG cachet_ver=2.3.18
ARG archive_url=https://github.com/CachetHQ/Cachet/archive/v${cachet_ver}.tar.gz

ENV cachet_ver ${cachet_ver}
ENV archive_url ${archive_url}

RUN set -eux; \
	curl -o cachet.tar.gz -fSL "${archive_url}"; \
	# upstream tarball include ./Cachet-${cachet_ver}/
	tar -xf cachet.tar.gz -C /var/www/html --strip-components=1; \
	rm cachet.tar.gz; \
	composer.phar global require "hirak/prestissimo:^0.3"; \
	composer.phar install -q -o; \
	rm -rf bootstrap/cache/* ~/.composer /bin/composer.phar; \
	chown -R www-data:www-data /var/www/html

COPY conf/php-fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY conf/supervisord.conf /etc/supervisor/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx-site.conf /etc/nginx/conf.d/default.conf
COPY conf/.env.docker /var/www/html/.env
COPY entrypoint.sh /usr/local/bin/

EXPOSE 8000
CMD ["entrypoint.sh"]
