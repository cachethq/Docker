#!/usr/bin/env bats
load test_helpers
load docker_helpers
load "lib/batslib"
load "lib/output"

export APP_KEY="base64:v2LwHrdgnE+RavEXdnF8LgWIibjvEcFkU2qaX5Ji708="

@test "[$TEST_FILE] testing Cachet Docker image build" {
  command docker-compose build --no-cache cachet
}

@test "[$TEST_FILE] testing Cachet docker-compose up" {
  command docker-compose up -d
}

@test "[$TEST_FILE] check for container init" {
  docker_wait_for_log docker_cachet_1 15 "Initializing Cachet container ..."
}

@test "[$TEST_FILE] check for postgres database startup" {
  docker_wait_for_log docker_postgres_1 120 "LOG:  autovacuum launcher started"
}

@test "[$TEST_FILE] check for empty sessions table" {
  docker_wait_for_log docker_cachet_1 15 "Table chq_sessions does not exist! ..."
}

@test "[$TEST_FILE] check for DB init" {
  docker_wait_for_log docker_cachet_1 15 "Initializing Cachet database ..."
}

@test "[$TEST_FILE] check for populated sessions table" {
  docker_wait_for_log docker_cachet_1 15 "Table chq_sessions exists! ..."
}

@test "[$TEST_FILE] check for container start message" {
  docker_wait_for_log docker_cachet_1 15 "Starting Cachet! ..."
}

@test "[$TEST_FILE] check for nginx startup" {
  docker_wait_for_log docker_cachet_1 15 "INFO success: nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)"
}

@test "[$TEST_FILE] check for php-fpm startup" {
  docker_wait_for_log docker_cachet_1 15 "INFO success: php-fpm entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)"
}

@test "[$TEST_FILE] check for queue-worker startup" {
  docker_wait_for_log docker_cachet_1 15 "INFO success: queue-worker entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)"
}

@test "[$TEST_FILE] php artisan cachet:seed" {
  run docker exec docker_cachet_1 php artisan cachet:seed
  assert_output -l 0 $'Database seeded with demo data successfully!'
}

@test "[$TEST_FILE] curl 200 response test" {
	run curl_container docker_cachet_1 :8000/auth/login --head
  assert_output -l 0 $'HTTP/1.1 200 OK\r'
}

@test "[$TEST_FILE] login test" {
	run curl_container docker_cachet_1 :8000/auth/login --head --user test:test123
  assert_output -l 0 $'HTTP/1.1 200 OK\r'
}

@test "[$TEST_FILE] check for curl API pong" {
	run curl_container docker_cachet_1 :8000/api/v1/ping
  assert_output -l 0 $'{"data":"Pong!"}'
}

@test "[$TEST_FILE] check for pg_dump version mismatch" {
  run docker exec docker_cachet_1 php artisan app:update
  refute_output -l 5 $'pg_dump: aborting because of server version mismatch'
}

@test "[$TEST_FILE] ensure there are no volumes" {
	run docker inspect -f '{{ .Mounts }}' docker_cachet_1
  assert_output -l 0 $'[]'
}

@test "[$TEST_FILE] restart cachet" {
  command docker-compose stop cachet
  command docker-compose rm -f cachet
  command docker-compose up -d
  docker_wait_for_log docker_cachet_1 15 "INFO success: nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)"
}

@test "[$TEST_FILE] post-restart API pong" {
	run curl_container docker_cachet_1 :8000/api/v1/ping
  assert_output -l 0 $'{"data":"Pong!"}'
}

@test "[$TEST_FILE] post-restart login test" {
	run curl_container docker_cachet_1 :8000/auth/login --head --user test:test123
  assert_output -l 0 $'HTTP/1.1 200 OK\r'
}

@test "[$TEST_FILE] stop all test containers" {
	stop_bats_containers
}

@test "[$TEST_FILE] Cleanup test containers" {
	docker_clean docker_cachet_1
  docker_clean docker_postgres_1
}
