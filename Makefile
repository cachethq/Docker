SILENT :
.PHONY : test


REPOSITORY := $(shell cat REPO)
VERSION := $(shell cat VERSION)
REVISION := $(shell cat REVISION)
BUILD_TIME := $(shell date +%FT%T%z)
GITREV := $(shell git rev-parse HEAD)

# omit REVISION if it is an empty string
ifneq (${REVISION},)
FULL_VERSION := ${VERSION}-${REVISION}
else
FULL_VERSION := ${VERSION}
endif

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
	docker build -t ${REPOSITORY}:${FULL_VERSION} --no-cache --label GITREV=${GITREV} --label BUILD_TIME=${BUILD_TIME} --build-arg cachet_ver=${VERSION} .

push: build
	docker push ${REPOSITORY}:${FULL_VERSION}
