#!/bin/bash
set -e

[[ $DEBUG == true ]] && set -x

check_database_connection() {
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
    timeout=$(expr $timeout - 1)
    if [[ $timeout -eq 0 ]]; then
      echo
      echo "Could not connect to database server. Aborting..."
      return 1
    fi
    echo -n "."
    sleep 1
  done
  echo
}

initialize_system() {
  APP_ENV=${APP_ENV:-development}
  APP_DEBUG=${APP_DEBUG:-true}
  APP_URL=${APP_URL:-http://localhost}
  APP_KEY=${APP_KEY:-SECRET}

  DB_DRIVER=${DB_DRIVER:-pgsql}
  DB_HOST=${DB_HOST:-postgres}
  DB_DATABASE=${DB_DATABASE:-cachet}
  DB_USERNAME=${DB_USERNAME:-postgres}
  DB_PASSWORD=${DB_PASSWORD:-postgres}
  DB_PORT=${DB_PORT:-5432}

  CACHE_DRIVER=${CACHE_DRIVER:-apc}
  SESSION_DRIVER=${SESSION_DRIVER:-apc}
  QUEUE_DRIVER=${QUEUE_DRIVER:-database}

  MAIL_DRIVER=${MAIL_DRIVER:-smtp}
  MAIL_HOST=${MAIL_HOST:-mailtrap.io}
  MAIL_PORT=${MAIL_PORT:-2525}
  MAIL_USERNAME=${MAIL_USERNAME:-null}
  MAIL_PASSWORD=${MAIL_PASSWORD:-null}
  MAIL_ADDRESS=${MAIL_ADDRESS:-null}
  MAIL_NAME=${MAIL_NAME:-null}

  REDIS_HOST=${REDIS_HOST:-null}
  REDIS_DATABASE=${REDIS_DATABASE:-null}
  REDIS_PORT=${REDIS_PORT:-null}

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

  sed 's,{{CACHE_DRIVER}},'"${CACHE_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{SESSION_DRIVER}},'"${SESSION_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{QUEUE_DRIVER}},'"${QUEUE_DRIVER}"',g' -i /var/www/html/.env

  sed 's,{{MAIL_DRIVER}},'"${MAIL_DRIVER}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_HOST}},'"${MAIL_HOST}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_PORT}},'"${MAIL_PORT}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_USERNAME}},'"${MAIL_USERNAME}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_PASSWORD}},'"${MAIL_PASSWORD}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_ADDRESS}},'"${MAIL_ADDRESS}"',g' -i /var/www/html/.env
  sed 's,{{MAIL_NAME}},'"${MAIL_NAME}"',g' -i /var/www/html/.env

  sed 's,{{REDIS_HOST}},'"${REDIS_HOST}"',g' -i /var/www/html/.env
  sed 's,{{REDIS_DATABASE}},'"${REDIS_DATABASE}"',g' -i /var/www/html/.env
  sed 's,{{REDIS_PORT}},'"${REDIS_PORT}"',g' -i /var/www/html/.env

  php composer.phar install --no-dev -o
  php artisan app:install
  rm -rf bootstrap/cache/*
  touch /.cachet-installed
  start_system
}

start_system() {
  check_database_connection
  [ -f "/.cachet-installed" ] && echo "Starting Cachet" || initialize_system
  php artisan config:cache
  exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
}

case ${1} in
  init|start)

    case ${1} in
      start)
        start_system
        ;;
      init)
        initialize_system
        ;;
    esac
    ;;
  help)
    echo "Available options:"
    echo " start        - Starts the Cachet server (default)"
    echo " init         - Initialize the Cachet server (e.g. create databases, compile assets)."
    echo " help         - Displays the help"
    echo " [command]        - Execute the specified command, eg. bash."
    ;;
  *)
    exec "$@"
    ;;
esac

exit 0
