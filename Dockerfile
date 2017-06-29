FROM php:7.1.6-alpine

MAINTAINER Alt Three <support@alt-three.com>

EXPOSE 8000
CMD ["/sbin/entrypoint.sh"]
ARG cachet_ver
ENV cachet_ver ${cachet_ver:-master}

ENV COMPOSER_VERSION 1.4.1

# Using repo packages instead of compiling from scratch
RUN apk add --no-cache --update \
    postgresql-client \
    postgresql \
    mysql-client \
    libpng \
    nginx \
    wget sqlite git sudo curl bash grep \
    supervisor

RUN docker-php-source extract && \
    docker-php-ext-install gd && \
    docker-php-source delete 

# forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
#    ln -sf /dev/stderr /var/log/nginx/error.log && \
#    ln -sf /dev/stdout /var/log/php7/error.log && \
#    ln -sf /dev/stderr /var/log/php7/error.log

#RUN addgroup -S www-data
#RUN adduser -S -s /bin/bash -G www-data www-data

#RUN touch /var/run/nginx.pid /var/run/php5-fpm.pid && \
#    chown -R www-data:www-data /var/run/nginx.pid /var/run/php5-fpm.pid

RUN echo 'www-data ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir -p /var/www/html
RUN mkdir -p /usr/share/nginx/cache
RUN mkdir -p /var/cache/nginx
#    mkdir -p /var/lib/nginx
RUN chown -R www-data:www-data /var/www /usr/share/nginx/cache /var/cache/nginx /var/lib/nginx/

RUN ln -s /usr/bin/php7 /usr/bin/php

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');" && \
    php -r "copy('https://composer.github.io/installer.sig', '/tmp/composer-setup.sig');" && \
    php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" && \
    php /tmp/composer-setup.php --version=$COMPOSER_VERSION --install-dir=bin && \
    php -r "unlink('/tmp/composer-setup.php');"

WORKDIR /var/www/html/
USER www-data

RUN wget https://github.com/cachethq/Cachet/archive/${cachet_ver}.tar.gz && \
    tar xzvf ${cachet_ver}.tar.gz --strip-components=1 && \
    chown -R www-data /var/www/html && \
    rm -r ${cachet_ver}.tar.gz && \
    php /bin/composer.phar global require "hirak/prestissimo:^0.3" && \
    php /bin/composer.phar install --no-dev -o && \
    rm -rf bootstrap/cache/*

COPY conf/php-fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY conf/supervisord.conf /etc/supervisor/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx-site.conf /etc/nginx/conf.d/default.conf
COPY conf/.env.docker /var/www/html/.env
COPY entrypoint.sh /sbin/entrypoint.sh
