SILENT :
.PHONY : test

update-dependencies:
	docker pull curlimages/curl:latest
	docker pull postgres:9.5

test:
	bats test

compose-build:
	docker-compose build

compose-up:
	docker-compose up

build:
	docker build -t cachet/docker .
