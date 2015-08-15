FROM daocloud.io/jsw/cachet-base:master-d3506c1

COPY docker/entrypoint.sh /sbin/entrypoint.sh
RUN cd /var/www/html && \
    wget https://github.com/cachethq/Cachet/archive/v1.1.1.tar.gz && \
    tar xzvf v1.1.1.tar.gz --strip-components=1 && \
    rm v1.1.1.tar.gz && \
    php composer.phar install --no-dev -o && \
    chmod +x dbinit
WORKDIR /var/www/html/

# copy the various nginx and supervisor conf (to handle both fpm and nginx)
COPY docker/.env.docker /var/www/html/.env

COPY docker/crontab /etc/cron.d/artisan-schedule
RUN chmod 0644 /etc/cron.d/artisan-schedule &&\
    touch /var/log/cron.log

EXPOSE 8000

CMD ["/sbin/entrypoint.sh"]
