SILENT :
.PHONY : test


REPOSITORY := $(shell cat REPO)
VERSION := $(shell cat VERSION)
BUILD_TIME := $(shell date +%FT%T%z)
GITREV := $(shell git rev-parse HEAD)

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
	docker build -t ${REPOSITORY}:${VERSION} --label GITREV=${GITREV} --label BUILD_TIME=${BUILD_TIME} --build-arg cachet_ver=${VERSION} .

push: build
	docker push ${REPOSITORY}:${VERSION}
