FROM debian:jessie

# Using debian jessie packages instead of compiling from scratch
RUN DEBIAN_FRONTEND=noninteractive \
    echo "APT::Install-Recommends \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    echo "APT::Install-Suggests \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    apt-get -q -y update && \
    apt-get -q -y install \
    ca-certificates nginx php5-fpm=5.* php5-curl php5-readline php5-mcrypt php5-mysql php5-apcu php5-cli \
    wget sqlite git libsqlite3-dev curl supervisor cron php5-pgsql php5-sqlite && \
    apt-get clean && apt-get autoremove -q && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

COPY docker/supervisord.conf /etc/supervisor/supervisord.conf
COPY docker/php-fpm-pool.conf /etc/php5/fpm/pool.d/www.conf

# COPY docker/entrypoint.sh /sbin/entrypoint.sh
WORKDIR /var/www/html/

# copy the various nginx and supervisor conf (to handle both fpm and nginx)
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf && \
    echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm -f /etc/nginx/sites-enabled/* && \
    rm -f /etc/nginx/conf.d/* && \
#    mv /var/www/html/docker/.env.docker /var/www/html/.env && \
#   ^ Move this to upper level of image
    chown -R www-data /var/www/html && \
    curl -sS https://getcomposer.org/installer | php

COPY docker/nginx-site.conf /etc/nginx/conf.d/default.conf
    
# EXPOSE 8000

# COPY docker/crontab /etc/cron.d/artisan-schedule
# RUN chmod 0644 /etc/cron.d/artisan-schedule
# RUN touch /var/log/cron.log

# ^ Also these

CMD ["/bin/bash"]
# ^ From debian:latest, had better not run it directly
