#!/usr/bin/env bats
load test_helpers
load docker_helpers
load "lib/batslib"
load "lib/output"

@test "[$TEST_FILE] testing Cachet Docker image build" {
  command docker-compose build --no-cache cachet
}

@test "[$TEST_FILE] testing Cachet docker-compose up" {
  command docker-compose up -d
}

@test "[$TEST_FILE] wait for Cachet startup" {
  docker_wait_for_log docker_cachet_1 15 "INFO success: php-fpm entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)"
}

@test "[$TEST_FILE] wait for postgres startup" {
  docker_wait_for_log docker_postgres_1 15 "LOG:  autovacuum launcher started"
}

@test "[$TEST_FILE] php artisan cachet:seed" {
  command docker exec docker_cachet_1 php artisan cachet:seed
}

@test "[$TEST_FILE] curl 200 test" {
	run curl_container docker_nginx_1 /auth/login --head
  assert_output -l 0 $'HTTP/1.1 200 OK\r'
}

@test "[$TEST_FILE] login test" {
	run curl_container docker_nginx_1 /auth/login --head --user test:test123
  assert_output -l 0 $'HTTP/1.1 200 OK\r'
}

@test "[$TEST_FILE] curl API ping" {
	run curl_container docker_nginx_1 /api/v1/ping
  assert_output -l 0 $'{"data":"Pong!"}'
}

@test "[$TEST_FILE] stop all bats containers" {
	stop_bats_containers
}

@test "[$TEST_FILE] Cleanup containers" {
	docker_clean docker_cachet_1
  docker_clean docker_nginx_1
  docker_clean docker_postgres_1
}
