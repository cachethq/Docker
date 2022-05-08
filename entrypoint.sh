#!/bin/bash
set -o errexit -o nounset -o pipefail

[ "${DEBUG:-false}" == true ] && set -x

if [[ -z "${DB_DRIVER+xxx}" || -z "$DB_DRIVER" ]]; then
  DB_DRIVER="sqlite"
fi

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
    sqlite)
      touch /var/www/html/database/database.sqlite
      prog="touch /var/www/html/database/database.sqlite"
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

check_sendmail() {
	if [[ "${MAIL_DRIVER:-}" == "sendmail" ]]; then
		sudo /usr/sbin/postfix start
	fi
}

initialize_system() {
  echo "Initializing Cachet container ..."

  APP_KEY=${APP_KEY:-}
  APP_ENV=${APP_ENV:-development}
  APP_DEBUG=${APP_DEBUG:-true}
  APP_URL=${APP_URL:-http://localhost}
  APP_LOG=${APP_LOG:-errorlog}

  DB_DRIVER=${DB_DRIVER:-pgsql}
  DB_HOST=${DB_HOST:-postgres}
  DB_DATABASE=${DB_DATABASE:-cachet}
  DB_PREFIX=${DB_PREFIX:-}
  DB_USERNAME=${DB_USERNAME:-postgres}
  DB_PASSWORD=${DB_PASSWORD:-postgres}
  DB_PORT=${DB_PORT:-}
  DB_PREFIX=${DB_PREFIX:-}

  if [[ "${DB_DRIVER}" = "pgsql" ]]; then
    DB_PORT=${DB_PORT:-5432}
  fi

  if [[ "${DB_DRIVER}" = "mysql" ]]; then
    DB_PORT=${DB_PORT:-3306}
  fi

  if [[ "${DB_DRIVER}" = "sqlite" ]]; then
    DB_DATABASE=""
    DB_HOST=""
    DB_PORT=""
    DB_USERNAME=""
    DB_PASSWORD=""
  fi

  CACHE_DRIVER=${CACHE_DRIVER:-apc}

  SESSION_DRIVER=${SESSION_DRIVER:-apc}
  SESSION_DOMAIN=${SESSION_DOMAIN:-}
  SESSION_SECURE_COOKIE=${SESSION_SECURE_COOKIE:-}

  QUEUE_DRIVER=${QUEUE_DRIVER:-database}
  CACHET_EMOJI=${CACHET_EMOJI:-false}
  CACHET_BEACON=${CACHET_BEACON:-true}
  CACHET_AUTO_TWITTER=${CACHET_AUTO_TWITTER:-true}

  MAIL_DRIVER=${MAIL_DRIVER:-smtp}
  MAIL_HOST=${MAIL_HOST:-localhost}
  MAIL_PORT=${MAIL_PORT:-25}
  MAIL_USERNAME=${MAIL_USERNAME:-}
  MAIL_PASSWORD=${MAIL_PASSWORD:-}
  MAIL_ADDRESS=${MAIL_ADDRESS:-}
  MAIL_NAME=${MAIL_NAME:-}
  MAIL_ENCRYPTION=${MAIL_ENCRYPTION:-}

  REDIS_HOST=${REDIS_HOST:-}
  REDIS_DATABASE=${REDIS_DATABASE:-}
  REDIS_PORT=${REDIS_PORT:-}
  REDIS_PASSWORD=${REDIS_PASSWORD:-}

  GITHUB_TOKEN=${GITHUB_TOKEN:-}

  NEXMO_KEY=${NEXMO_KEY:-}
  NEXMO_SECRET=${NEXMO_SECRET:-}
  NEXMO_SMS_FROM=${NEXMO_SMS_FROM:-Cachet}

  PHP_MAX_CHILDREN=${PHP_MAX_CHILDREN:-5}
  
  TRUSTED_PROXIES=${TRUSTED_PROXIES:-}

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
  sed 's,{{DB_PREFIX}},'"${DB_PREFIX}"',g' -i /var/www/html/.env

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
  
  sed 's,{{TRUSTED_PROXIES}},'"${TRUSTED_PROXIES}"',g' -i /var/www/html/.env
  
  if [[ -z "${APP_KEY}" || "${APP_KEY}" = "null" ]]; then
    keygen="$(php artisan key:generate --show)"
    APP_KEY=$(echo "${keygen}")
    echo "ERROR: Please set the 'APP_KEY=${APP_KEY}' environment variable at runtime or in docker-compose.yml and re-launch"
    exit 0
  fi

  sed "s,{{APP_KEY}},$APP_KEY,g" -i /var/www/html/.env

  # remove empty lines
  sed '/^.*=""$/d'  -i /var/www/html/.env

  rm -rf bootstrap/cache/*
}

init_db() {
  echo "Initializing Cachet database ..."
  php artisan cachet:install --no-interaction
  check_configured
}

migrate_db() {
  force=""
  if [[ "${FORCE_MIGRATION:-false}" == true ]]; then
    force="--force"
  fi
  php artisan migrate ${force}
}

seed_db() {
  php artisan db:seed
}

start_system() {
  initialize_system
  check_database_connection
  check_configured
  migrate_db
  seed_db
  echo "Starting Cachet! ..."
  php artisan config:cache
  /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
}

check_sendmail
start_system

exit 0
