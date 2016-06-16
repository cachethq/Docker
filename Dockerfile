FROM debian:jessie

MAINTAINER Alt Three <support@alt-three.com>

ARG cachet_ver
ENV cachet_ver master

# Using debian packages instead of compiling from scratch
RUN DEBIAN_FRONTEND=noninteractive \
    echo "APT::Install-Recommends \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    echo "APT::Install-Suggests \"0\";" >> /etc/apt/apt.conf.d/02recommends && \
    apt-get clean && \
    apt-get -q -y update && \
    apt-get -q -y install \
    ca-certificates=20141019+deb8u1 php5-fpm=5.6.22+dfsg-0+deb8u1 php5-curl=5.6.22+dfsg-0+deb8u1 \
    php5-readline=5.6.22+dfsg-0+deb8u1 php5-mcrypt=5.6.22+dfsg-0+deb8u1 sudo=1.8.10p3-1+deb8u3 \
    php5-mysql=5.6.22+dfsg-0+deb8u1 php5-apcu=4.0.7-1 php5-cli=5.6.22+dfsg-0+deb8u1 \
    php5-gd=5.6.22+dfsg-0+deb8u1 php5-mysql=5.6.22+dfsg-0+deb8u1 php5-pgsql=5.6.22+dfsg-0+deb8u1 \
    php5-sqlite=5.6.22+dfsg-0+deb8u1 wget=1.16-1 sqlite=2.8.17-12 git=1:2.1.4-2.1+deb8u2 \
    libsqlite3-dev=3.8.7.1-1+deb8u1 postgresql-client=9.4+165+deb8u1 mysql-client=5.5.49-0+deb8u1 \
    supervisor=3.0r1-1 cron=3.0pl1-127+deb8u1 && \
    apt-get clean && apt-get autoremove -q && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

COPY conf/php-fpm-pool.conf /etc/php5/fpm/pool.d/www.conf
COPY conf/supervisord.conf /etc/supervisor/supervisord.conf

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN mkdir -p /var/www/html && \
    chown -R www-data /var/www

COPY conf/crontab /etc/cron.d/artisan-schedule
COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 0644 /etc/cron.d/artisan-schedule && \
        touch /var/log/cron.log

RUN adduser www-data sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /var/www/html/
USER www-data

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '070854512ef404f16bac87071a6db9fd9721da1684cd4589b1196c3faf71b9a2682e2311b36a5079825e155ac7ce150d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --version=1.1.2 && \
    php -r "unlink('composer-setup.php');"

RUN wget https://github.com/cachethq/Cachet/archive/${cachet_ver}.tar.gz && \
    tar xzvf ${cachet_ver}.tar.gz --strip-components=1 && \
    chown -R www-data /var/www/html && \
    rm -r ${cachet_ver}.tar.gz && \
    php composer.phar install --no-dev -o && \
    rm -rf bootstrap/cache/*

COPY conf/.env.docker /var/www/html/.env

VOLUME /var/www
EXPOSE 8000

ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["start"]
