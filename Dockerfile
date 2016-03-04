FROM debian:sid

MAINTAINER Alt Three <support@alt-three.com>

# Using debian jessie packages instead of compiling from scratch
RUN DEBIAN_FRONTEND=noninteractive \
    echo "APT::Install-Recommends \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    echo "APT::Install-Suggests \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    apt-get clean && \
    apt-get -q -y update && \
    apt-get -q -y install \
    ca-certificates php7.0-cli php7.0-fpm php7.0-gd php7.0-mbstring php7.0-mysql php7.0-pgsql php7.0-sqlite \
    wget sqlite git libsqlite3-dev curl supervisor cron unzip && \
    apt-get clean && apt-get autoremove -q && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

COPY docker/supervisord.conf /etc/supervisor/supervisord.conf
COPY docker/php-fpm-pool.conf /etc/php/7.0/fpm/pool.d/www.conf

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/7.0/fpm/php-fpm.conf && \
    mkdir /run/php

WORKDIR /var/www/html/

# Install composer
RUN curl -sS https://getcomposer.org/installer | php

RUN wget https://github.com/CachetHQ/Cachet/archive/v2.1.0.tar.gz && \
    tar xzvf v2.1.0.tar.gz --strip-components=1 && \
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
