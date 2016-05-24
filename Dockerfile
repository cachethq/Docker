FROM debian:jessie

MAINTAINER Alt Three <support@alt-three.com>

# Using debian packages instead of compiling from scratch
RUN DEBIAN_FRONTEND=noninteractive \
    echo "APT::Install-Recommends \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    echo "APT::Install-Suggests \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    apt-get clean && \
    apt-get -q -y update && \
    apt-get -q -y install \
    ca-certificates php5-fpm=5.* php5-curl php5-readline php5-mcrypt \
    php5-mysql php5-apcu php5-cli php5-gd php5-mysql php5-pgsql php5-sqlite \
    wget sqlite git libsqlite3-dev postgresql-client mysql-client curl supervisor cron unzip && \
    apt-get clean && apt-get autoremove -q && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

COPY docker/supervisord.conf /etc/supervisor/supervisord.conf
COPY docker/php-fpm-pool.conf /etc/php5/fpm/pool.d/www.conf

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf

WORKDIR /var/www/html/

# Install composer
RUN curl -sS https://getcomposer.org/installer | php

RUN wget https://github.com/cachethq/Cachet/archive/v2.2.2.tar.gz && \
    tar xzvf v2.2.2.tar.gz --strip-components=1 && \
    chown -R www-data /var/www/html && \
    rm -r v2.2.2.tar.gz && \
    php composer.phar install --no-dev -o

COPY docker/entrypoint.sh /sbin/entrypoint.sh
COPY docker/.env.docker /var/www/html/.env
COPY docker/crontab /etc/cron.d/artisan-schedule

RUN chmod 0644 /etc/cron.d/artisan-schedule &&\
    touch /var/log/cron.log &&\
    chown www-data /var/www/html/.env

VOLUME /var/www
EXPOSE 8000

ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["start"]
