FROM daocloud.io/jsw/cachet-base:master-9f93b3a

ADD docker/entrypoint.sh /sbin/entrypoint.sh
ADD docker/dbinit.sh /var/www/html/dbinit
RUN cd /var/www/html ;\
    wget https://github.com/cachethq/Cachet/archive/v1.1.1.tar.gz ;\
    tar xzvf v1.1.1.tar.gz --strip-components=1 ;\
    rm v1.1.1.tar.gz
WORKDIR /var/www/html/

# copy the various nginx and supervisor conf (to handle both fpm and nginx)
RUN mv /var/www/html/docker/.env.docker /var/www/html/.env ;\
    chmod +x dbinit
    
EXPOSE 8000

COPY docker/crontab /etc/cron.d/artisan-schedule
RUN chmod 0644 /etc/cron.d/artisan-schedule ;\
    touch /var/log/cron.log

CMD ["/sbin/entrypoint.sh"]
