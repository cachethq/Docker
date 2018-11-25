SILENT :
.PHONY : test

update-dependencies:
	docker pull appropriate/curl:latest
	docker pull postgres:9.5

test:
	export APP_KEY="base64:omOzwjXIwR01CrmdBk6sLfUXOQVx8ZkAaBmO05BOx+4="
	bats test

compose-build:
	docker-compose build

compose-up:
	docker-compose up

build:
	docker build -t cachet/docker	.
