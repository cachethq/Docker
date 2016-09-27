FROM debian:jessie

MAINTAINER Alt Three <support@alt-three.com>

ARG cachet_ver
ENV cachet_ver master

ENV PG_MAJOR 9.5

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

# Using debian packages instead of compiling from scratch
RUN DEBIAN_FRONTEND=noninteractive \
    echo "APT::Install-Recommends \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    echo "APT::Install-Suggests \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    apt-get clean && \
    apt-get -q -y update && \
    apt-get -q -y install \
    ca-certificates \
    postgresql-client-$PG_MAJOR \
    mysql-client \
    nginx \
    php5-fpm php5-curl \
    php5-readline php5-mcrypt sudo \
    php5-mysql php5-apcu php5-cli \
    php5-gd php5-mysql php5-pgsql \
    php5-sqlite wget sqlite git \
    libsqlite3-dev \
    supervisor cron && \
    apt-get clean && apt-get autoremove -q && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

COPY conf/php-fpm-pool.conf /etc/php5/fpm/pool.d/www.conf
COPY conf/supervisord.conf /etc/supervisor/supervisord.conf
COPY conf/nginx-site.conf /etc/nginx/sites-available/default

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir -p /var/www/html && \
    chown -R www-data /var/www

COPY conf/crontab /etc/cron.d/artisan-schedule
COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 0644 /etc/cron.d/artisan-schedule && \
        touch /var/log/cron.log

RUN adduser www-data sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /var/www/html/
USER www-data

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');" && \
    php -r "copy('https://composer.github.io/installer.sig', '/tmp/composer-setup.sig');" && \
    php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" && \
    php /tmp/composer-setup.php --version=1.1.2 && \
    php -r "unlink('composer-setup.php');"

RUN wget https://github.com/cachethq/Cachet/archive/${cachet_ver}.tar.gz && \
    tar xzvf ${cachet_ver}.tar.gz --strip-components=1 && \
    chown -R www-data /var/www/html && \
    rm -r ${cachet_ver}.tar.gz && \
    php composer.phar install --no-dev -o && \
    rm -rf bootstrap/cache/*

COPY conf/.env.docker /var/www/html/.env

VOLUME /var/www
EXPOSE 80

ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["start"]
