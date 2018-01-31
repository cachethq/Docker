#!/bin/bash
set -eo pipefail

[[ "${DEBUG}" == true ]] && set -x

check_database_connection() {
  echo "Attempting to connect to database ..."
  case "${DB_DRIVER}" in
    mysql)
      prog="mysqladmin -h ${DB_HOST} -u ${DB_USERNAME} ${DB_PASSWORD:+-p$DB_PASSWORD} -P ${DB_PORT} status"
      ;;
    pgsql)
      prog="/usr/bin/pg_isready"
      prog="${prog} -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USERNAME} -d ${DB_DATABASE} -t 1"
      ;;
  esac
  timeout=60
  while ! ${prog} >/dev/null 2>&1
  do
    timeout=$(( timeout - 1 ))
    if [[ "$timeout" -eq 0 ]]; then
      echo
      echo "Could not connect to database server! Aborting..."
      exit 1
    fi
    echo -n "."
    sleep 1
  done
  echo
}

checkdbinitmysql() {
    table=sessions
    if [[ "$(mysql -N -s -h "${DB_HOST}" -u "${DB_USERNAME}" "${DB_PASSWORD:+-p$DB_PASSWORD}" "${DB_DATABASE}" -P "${DB_PORT}" -e \
        "select count(*) from information_schema.tables where \
            table_schema='${DB_DATABASE}' and table_name='${DB_PREFIX}${table}';")" -eq 1 ]]; then
        echo "Table ${DB_PREFIX}${table} exists! ..."
    else
        echo "Table ${DB_PREFIX}${table} does not exist! ..."
        init_db
    fi

}

checkdbinitpsql() {
    table=sessions
    export PGPASSWORD=${DB_PASSWORD}
    if [[ "$(psql -h "${DB_HOST}" -p "${DB_PORT}" -U "${DB_USERNAME}" -d "${DB_DATABASE}" -c "SELECT to_regclass('${DB_PREFIX}${table}');" | grep -c "${DB_PREFIX}${table}")" -eq 1 ]]; then
        echo "Table ${DB_PREFIX}${table} exists! ..."
    else
        echo "Table ${DB_PREFIX}${table} does not exist! ..."
        init_db
    fi

}

check_configured() {
  case "${DB_DRIVER}" in
    mysql)
      checkdbinitmysql
      ;;
    pgsql)
      checkdbinitpsql
      ;;
  esac
}

initialize_system() {
  echo "Initializing Cachet container ..."

  APP_KEY=${APP_KEY:-null}
  APP_ENV=${APP_ENV:-development}
  APP_DEBUG=${APP_DEBUG:-true}
  APP_URL=${APP_URL:-http://localhost}
  APP_LOG=${APP_LOG:-errorlog}

  DB_DRIVER=${DB_DRIVER:-pgsql}
  DB_HOST=${DB_HOST:-postgres}
  DB_DATABASE=${DB_DATABASE:-cachet}
  DB_PREFIX=${DB_PREFIX}
  DB_USERNAME=${DB_USERNAME:-postgres}
  DB_PASSWORD=${DB_PASSWORD:-postgres}

  if [[ "${DB_DRIVER}" = "pgsql" ]]; then
    DB_PORT=${DB_PORT:-5432}
  fi

  if [[ "${DB_DRIVER}" = "mysql" ]]; then
    DB_PORT=${DB_PORT:-3306}
  fi

  DB_PORT=${DB_PORT}

  CACHE_DRIVER=${CACHE_DRIVER:-apc}

  SESSION_DRIVER=${SESSION_DRIVER:-apc}
  SESSION_DOMAIN=${SESSION_DOMAIN:-$APP_URL}
  SESSION_SECURE_COOKIE=${SESSION_SECURE_COOKIE:-false}

  QUEUE_DRIVER=${QUEUE_DRIVER:-database}
  CACHET_EMOJI=${CACHET_EMOJI:-false}
  CACHET_BEACON=${CACHET_BEACON:-true}
  CACHET_AUTO_TWITTER=${CACHET_AUTO_TWITTER:-true}

  MAIL_DRIVER=${MAIL_DRIVER:-smtp}
  MAIL_HOST=${MAIL_HOST:-localhost}
  MAIL_PORT=${MAIL_PORT:-25}
  MAIL_USERNAME=${MAIL_USERNAME:-null}
  MAIL_PASSWORD=${MAIL_PASSWORD:-null}
  MAIL_ADDRESS=${MAIL_ADDRESS:-null}
  MAIL_NAME=${MAIL_NAME:-null}
  MAIL_ENCRYPTION=${MAIL_ENCRYPTION:-null}

  REDIS_HOST=${REDIS_HOST:-null}
  REDIS_DATABASE=${REDIS_DATABASE:-null}
  REDIS_PORT=${REDIS_PORT:-null}
  REDIS_PASSWORD=${REDIS_PASSWORD:-null}

  GITHUB_TOKEN=${GITHUB_TOKEN:-null}

  NEXMO_KEY=${NEXMO_KEY:-null}
  NEXMO_SECRET=${NEXMO_SECRET:-null}
  NEXMO_SMS_FROM=${NEXMO_SMS_FROM:-Cachet}

  PHP_MAX_CHILDREN=${PHP_MAX_CHILDREN:-5}

  # configure env file

  sed 's,{{APP_ENV}},'"${APP_ENV}"',g' -i /var/www/html/.env
  sed 's,{{APP_DEBUG}},'"${APP_DEBUG}"',g' -i /var/www/html/.env
  sed 's,{{APP_URL}},'"${APP_URL}"',g' -i /var/www/html/.env
  sed 's,{{APP_LOG}},'"${APP_LOG}"',g' -i /var/www/html/.env

  sed 's,{{DB_DRIVER}},'"${DB_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{DB_HOST}},'"${DB_HOST}"',g' -i /var/www/html/.env
  sed 's,{{DB_DATABASE}},'"${DB_DATABASE}"',g' -i /var/www/html/.env
  sed 's,{{DB_PREFIX}},'"${DB_PREFIX}"',g' -i /var/www/html/.env
  sed 's,{{DB_USERNAME}},'"${DB_USERNAME}"',g' -i /var/www/html/.env
  sed 's,{{DB_PASSWORD}},'"${DB_PASSWORD}"',g' -i /var/www/html/.env
  sed 's,{{DB_PORT}},'"${DB_PORT}"',g' -i /var/www/html/.env

  sed 's,{{CACHE_DRIVER}},'"${CACHE_DRIVER}"',g' -i /var/www/html/.env

  sed 's,{{SESSION_DRIVER}},'"${SESSION_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{SESSION_DOMAIN}},'"${SESSION_DOMAIN}"',g' -i /var/www/html/.env
  sed 's,{{SESSION_SECURE_COOKIE}},'"${SESSION_SECURE_COOKIE}"',g' -i /var/www/html/.env

  sed 's,{{QUEUE_DRIVER}},'"${QUEUE_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{CACHET_EMOJI}},'"${CACHET_EMOJI}"',g' -i /var/www/html/.env
  sed 's,{{CACHET_BEACON}},'"${CACHET_BEACON}"',g' -i /var/www/html/.env
  sed 's,{{CACHET_AUTO_TWITTER}},'"${CACHET_AUTO_TWITTER}"',g' -i /var/www/html/.env

  sed 's,{{MAIL_DRIVER}},'"${MAIL_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_HOST}},'"${MAIL_HOST}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_PORT}},'"${MAIL_PORT}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_USERNAME}},'"${MAIL_USERNAME}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_PASSWORD}},'"${MAIL_PASSWORD}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_ADDRESS}},'"${MAIL_ADDRESS}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_NAME}},'"${MAIL_NAME}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_ENCRYPTION}},'"${MAIL_ENCRYPTION}"',g' -i /var/www/html/.env

  sed 's,{{REDIS_HOST}},'"${REDIS_HOST}"',g' -i /var/www/html/.env
  sed 's,{{REDIS_DATABASE}},'"${REDIS_DATABASE}"',g' -i /var/www/html/.env
  sed 's,{{REDIS_PORT}},'"${REDIS_PORT}"',g' -i /var/www/html/.env
  sed 's,{{REDIS_PASSWORD}},'"${REDIS_PASSWORD}"',g' -i /var/www/html/.env

  sed 's,{{GITHUB_TOKEN}},'"${GITHUB_TOKEN}"',g' -i /var/www/html/.env

  sed 's,{{NEXMO_KEY}},'"${NEXMO_KEY}"',g' -i /var/www/html/.env
  sed 's,{{NEXMO_SECRET}},'"${NEXMO_SECRET}"',g' -i /var/www/html/.env
  sed 's,{{NEXMO_SMS_FROM}},'"${NEXMO_SMS_FROM}"',g' -i /var/www/html/.env

  sed 's,{{PHP_MAX_CHILDREN}},'"${PHP_MAX_CHILDREN}"',g' -i /etc/php7/php-fpm.d/www.conf

  if [[ "${APP_KEY}" == null ]]; then
    keygen="$(php artisan key:generate)"
    appkey=$(echo "${keygen}" | grep -oP '(?<=\[).*(?=\])')
    echo "ERROR: Please set the 'APP_KEY=${appkey}' environment variable at runtime or in docker-compose.yml and re-launch"
    exit 0
  fi

  sed "s,{{APP_KEY}},$APP_KEY,g" -i /var/www/html/.env

  rm -rf bootstrap/cache/*
}

init_db() {
  echo "Initializing Cachet database ..."
  php artisan app:install
  check_configured
}

start_system() {
  initialize_system
  check_database_connection
  check_configured
  php artisan migrate
  echo "Starting Cachet! ..."
  php artisan config:cache
  /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
}

start_system

exit 0
