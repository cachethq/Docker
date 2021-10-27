SILENT :
.PHONY : test


REPOSITORY := $(shell cat REPO)
VERSION := $(shell cat VERSION)
BUILD_TIME := $(shell date +%FT%T%z)
GITREV := $(shell git rev-parse HEAD)

# Read and preapend `-` to the iteration if any, else return `` (nil)
REVISION := $(shell sed  '1s;^;-;' REVISION 2> /dev/null  || printf "" )
FULL_VERSION := ${VERSION}${REVISION}

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
	docker build -t ${REPOSITORY}:${FULL_VERSION} --label GITREV=${GITREV} --label BUILD_TIME=${BUILD_TIME} --build-arg cachet_ver=${VERSION} .

push: build
	docker push ${REPOSITORY}:${FULL_VERSION}
