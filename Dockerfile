FROM cachethq/cachet:base-d3506c1

COPY docker/entrypoint.sh /sbin/entrypoint.sh
RUN cd /var/www/html && \
    wget https://github.com/cachethq/Cachet/archive/1.1.1.tar.gz && \
    tar xzvf 1.1.1.tar.gz --strip-components=1 && \
    chown -R www-data /var/www/html && \
    rm -r 1.1.1.tar.gz && \
    php composer.phar install --no-dev -o --no-scripts && \
    cp -n vendor/jenssegers/date/src/Lang/zh.php vendor/jenssegers/date/src/Lang/zh-CN.php 
WORKDIR /var/www/html/

# copy the various nginx and supervisor conf (to handle both fpm and nginx)
COPY docker/.env.docker /var/www/html/.env

COPY docker/crontab /etc/cron.d/artisan-schedule
RUN chmod 0644 /etc/cron.d/artisan-schedule &&\
    touch /var/log/cron.log

EXPOSE 8000

CMD ["/sbin/entrypoint.sh"]
