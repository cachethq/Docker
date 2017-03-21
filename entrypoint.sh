#!/bin/bash
set -eo pipefail

[[ $DEBUG == true ]] && set -x

check_database_connection() {
  echo "Attempting to connect to database ..."
  case ${DB_DRIVER} in
    mysql)
      prog="mysqladmin -h ${DB_HOST} -u ${DB_USERNAME} ${DB_PASSWORD:+-p$DB_PASSWORD} status"
      ;;
    pgsql)
      prog=$(find /usr/lib/postgresql/ -name pg_isready)
      prog="${prog} -h ${DB_HOST} -U ${DB_USERNAME} -d ${DB_DATABASE} -t 1"
      ;;
  esac
  timeout=60
  while ! ${prog} >/dev/null 2>&1
  do
    timeout=$(( $timeout - 1 ))
    if [[ $timeout -eq 0 ]]; then
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
    if [ $(mysql -N -s -h ${DB_HOST} -u ${DB_USERNAME} ${DB_PASSWORD:+-p$DB_PASSWORD} ${DB_DATABASE} -e \
        "select count(*) from information_schema.tables where \
            table_schema='${DB_DATABASE}' and table_name='${table}';") -eq 1 ]; then
        echo "Table ${table} exists! ..."
    else
        echo "Table ${table} does not exist! ..."
        init_db
    fi

}

checkdbinitpsql() {
    table=sessions
    export PGPASSWORD=${DB_PASSWORD}
    if [ "$(psql -h ${DB_HOST} -U ${DB_USERNAME} -d ${DB_DATABASE} -c "SELECT to_regclass('${table}');" | grep -c "${table}")" -eq 1 ]; then
        echo "Table ${table} exists! ..."
    else
        echo "Table ${table} does not exist! ..."
        init_db
    fi

}

check_configured() {
  case ${DB_DRIVER} in
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
  APP_ENV=${APP_ENV:-development}
  APP_DEBUG=${APP_DEBUG:-true}
  APP_URL=${APP_URL:-http://localhost}
  APP_KEY=${APP_KEY:-base64:SGZXUdds0Qnbf55/7diaHMPPM2TXfOSxHtUAXz6POSw=}

  DB_DRIVER=${DB_DRIVER:-pgsql}
  DB_HOST=${DB_HOST:-postgres}
  DB_DATABASE=${DB_DATABASE:-cachet}
  DB_USERNAME=${DB_USERNAME:-postgres}
  DB_PASSWORD=${DB_PASSWORD:-postgres}

  if [ ${DB_DRIVER} = "pgsql" ]; then
    DB_PORT=${DB_PORT:-5432}
  fi

  if [ ${DB_DRIVER} = "mysql" ]; then
    DB_PORT=${DB_PORT:-3306}
  fi

  DB_PORT=${DB_PORT}

  CACHE_DRIVER=${CACHE_DRIVER:-apc}
  SESSION_DRIVER=${SESSION_DRIVER:-apc}
  QUEUE_DRIVER=${QUEUE_DRIVER:-database}
  CACHET_EMOJI=${CACHET_EMOJI:-false}

  MAIL_DRIVER=${MAIL_DRIVER:-smtp}
  MAIL_HOST=${MAIL_HOST:-mailtrap.io}
  MAIL_PORT=${MAIL_PORT:-2525}
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

  PHP_MAX_CHILDREN=${PHP_MAX_CHILDREN:-5}

  # configure env file

  sed 's,{{APP_ENV}},'"${APP_ENV}"',g' -i /var/www/html/.env
  sed 's,{{APP_DEBUG}},'"${APP_DEBUG}"',g' -i /var/www/html/.env
  sed 's,{{APP_URL}},'"${APP_URL}"',g' -i /var/www/html/.env
  sed 's,{{APP_KEY}},'${APP_KEY}',g' -i /var/www/html/.env

  sed 's,{{DB_DRIVER}},'"${DB_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{DB_HOST}},'"${DB_HOST}"',g' -i /var/www/html/.env
  sed 's,{{DB_DATABASE}},'"${DB_DATABASE}"',g' -i /var/www/html/.env
  sed 's,{{DB_USERNAME}},'"${DB_USERNAME}"',g' -i /var/www/html/.env
  sed 's,{{DB_PASSWORD}},'"${DB_PASSWORD}"',g' -i /var/www/html/.env
  sed 's,{{DB_PORT}},'"${DB_PORT}"',g' -i /var/www/html/.env

  sed 's,{{CACHE_DRIVER}},'"${CACHE_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{SESSION_DRIVER}},'"${SESSION_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{QUEUE_DRIVER}},'"${QUEUE_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{CACHET_EMOJI}},'"${CACHET_EMOJI}"',g' -i /var/www/html/.env

  sed 's,{{MAIL_DRIVER}},'"${MAIL_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_HOST}},'"${MAIL_HOST}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_PORT}},'"${MAIL_PORT}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_USERNAME}},'${MAIL_USERNAME}',g' -i /var/www/html/.env
  sed 's,{{MAIL_PASSWORD}},'${MAIL_PASSWORD}',g' -i /var/www/html/.env
  sed 's,{{MAIL_ADDRESS}},'${MAIL_ADDRESS}',g' -i /var/www/html/.env
  sed 's,{{MAIL_NAME}},'${MAIL_NAME}',g' -i /var/www/html/.env
  sed 's,{{MAIL_ENCRYPTION}},'${MAIL_ENCRYPTION}',g' -i /var/www/html/.env

  sed 's,{{REDIS_HOST}},'${REDIS_HOST}',g' -i /var/www/html/.env
  sed 's,{{REDIS_DATABASE}},'${REDIS_DATABASE}',g' -i /var/www/html/.env
  sed 's,{{REDIS_PORT}},'${REDIS_PORT}',g' -i /var/www/html/.env
  sed 's,{{REDIS_PASSWORD}},'${REDIS_PASSWORD}',g' -i /var/www/html/.env

  sed 's,{{GITHUB_TOKEN}},'"${GITHUB_TOKEN}"',g' -i /var/www/html/.env
  sudo sed 's,{{PHP_MAX_CHILDREN}},'"${PHP_MAX_CHILDREN}"',g' -i /etc/php5/fpm/pool.d/www.conf

  rm -rf bootstrap/cache/*
  chmod -R 777 storage
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
  echo "Starting Cachet! ..."
  php artisan config:cache
  /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
}

start_system

exit 0
