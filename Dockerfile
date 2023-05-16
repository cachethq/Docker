FROM nginx:1.21.6-alpine

EXPOSE 8000
CMD ["/sbin/entrypoint.sh"]

ARG cachet_ver
ARG archive_url

ENV cachet_ver ${cachet_ver}
ENV archive_url ${archive_url:-https://github.com/klarrio/Cachet/archive/refs/tags/${cachet_ver}.tar.gz}

ENV COMPOSER_VERSION 2.2.7

RUN apk add --no-cache --update \
    postgresql-client \
    postgresql \
    mysql-client \
    php7 \
    php7-redis \
    php7-apcu \
    php7-bcmath \
    php7-dom \
    php7-ctype \
    php7-curl \
    php7-fpm \
    php7-fileinfo \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    sqlite \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqlnd \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-pdo_sqlite \
    php7-phar \
    php7-posix \
    php7-session \
    php7-sqlite3 \
    php7-simplexml \
    php7-soap \
    php7-xml \
    php7-xmlwriter \
    php7-zip \
    php7-zlib \
    php7-tokenizer \
    wget sqlite git bash grep \
    supervisor

# apk add --no-cache curl~=7.79.0
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.16/main/ \
    curl=8.0.1-r0 \
    libxml2=2.9.14-r2 \
    libcrypto1.1=1.1.1t-r3 \
    libssl1.1=1.1.1t-r3 \
    libretls=3.5.2-r0 \
    libxslt=1.1.35-r0 \
    freetype=2.12.1-r0 \
    libcurl=8.0.1-r0 \
    xz-libs=5.2.5-r1 \
    pcre2=10.40-r0 \
    zlib=1.2.12-r3

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    ln -sf /dev/stdout /var/log/php7/error.log && \
    ln -sf /dev/stderr /var/log/php7/error.log

RUN adduser -S -s /bin/bash -u 1001 -G root www-data

RUN touch /var/run/nginx.pid && \
    chown -R www-data:root /var/run/nginx.pid /etc/php7/php-fpm.d

RUN mkdir -p /var/www/html && \
    mkdir -p /usr/share/nginx/cache && \
    mkdir -p /var/cache/nginx && \
    mkdir -p /var/lib/nginx && \
    chown -R www-data:root /var/www /usr/share/nginx/cache /var/cache/nginx /var/lib/nginx/

# Install composer
RUN wget https://getcomposer.org/installer -O /tmp/composer-setup.php && \
    wget https://composer.github.io/installer.sig -O /tmp/composer-setup.sig && \
    php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" && \
    php /tmp/composer-setup.php --version=$COMPOSER_VERSION --install-dir=bin && \
    php -r "unlink('/tmp/composer-setup.php');"

WORKDIR /var/www/html/
USER 1001

RUN wget ${archive_url} && \
    tar xzf ${cachet_ver}.tar.gz --strip-components=1 && \
    chown -R www-data:root /var/www/html && \
    rm -r ${cachet_ver}.tar.gz

COPY conf/php-fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY conf/supervisord.conf /etc/supervisor/supervisord.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx-site.conf /etc/nginx/conf.d/default.conf
COPY conf/.env.docker /var/www/html/.env
COPY entrypoint.sh /sbin/entrypoint.sh

RUN php /bin/composer.phar install --ignore-platform-reqs && \
    rm -rf bootstrap/cache/*

USER root
RUN chmod g+rwx /var/run/nginx.pid && \
    chmod -R g+rw /var/www /usr/share/nginx/cache /var/cache/nginx /var/lib/nginx/ /etc/php7/php-fpm.d storage
USER 1001
