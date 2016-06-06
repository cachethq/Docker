#!/usr/bin/env bats
load test_helpers
load docker_helpers
load "lib/batslib"
load "lib/output"

@test "[$TEST_FILE] testing Cachet Docker image build" {
  command docker-compose build cachet
}

@test "[$TEST_FILE] testing Cachet docker-compose up" {
  command docker-compose up -d
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

@test "[$TEST_FILE] stop all bats containers" {
	stop_bats_containers
}