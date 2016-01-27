FROM debian:jessie

MAINTAINER Alt Three <support@alt-three.com>

# Using debian jessie packages instead of compiling from scratch
RUN DEBIAN_FRONTEND=noninteractive \
    echo "APT::Install-Recommends \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    echo "APT::Install-Suggests \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    apt-get clean && \
    apt-get -q -y update && \
    apt-get -q -y install \
    ca-certificates nginx php5-fpm=5.* php5-curl php5-readline php5-mcrypt php5-mysql php5-apcu php5-cli \
    wget sqlite git libsqlite3-dev curl supervisor cron php5-pgsql php5-sqlite php5-gd && \
    apt-get clean && apt-get autoremove -q && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

COPY docker/supervisord.conf /etc/supervisor/supervisord.conf
COPY docker/php-fpm-pool.conf /etc/php5/fpm/pool.d/www.conf

WORKDIR /var/www/html/

# Copy the various nginx and supervisor conf (to handle both fpm and nginx)
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf && \
    echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm -f /etc/nginx/sites-enabled/* && \
    rm -f /etc/nginx/conf.d/* && \
    chown -R www-data /var/www/html && \
    curl -sS https://getcomposer.org/installer | php

COPY docker/nginx-site.conf /etc/nginx/conf.d/default.conf

RUN wget https://github.com/cachethq/Cachet/archive/master.tar.gz && \
    tar xzvf master.tar.gz --strip-components=1 && \
    chown -R www-data /var/www/html && \
    rm -r master.tar.gz && \
    php composer.phar install --no-dev -o

COPY docker/entrypoint.sh /sbin/entrypoint.sh
COPY docker/.env.docker /var/www/html/.env
COPY docker/crontab /etc/cron.d/artisan-schedule

RUN chmod 0644 /etc/cron.d/artisan-schedule &&\
    touch /var/log/cron.log &&\
    chown www-data /var/www/html/.env

EXPOSE 8000

CMD ["/sbin/entrypoint.sh"]
