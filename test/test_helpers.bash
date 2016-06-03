# Test if requirements are met
(
	type docker &>/dev/null || ( echo "docker is not available"; exit 1 )
)>&2

TEST_FILE=$(basename $BATS_TEST_FILENAME .bats)

# stop all containers with the "bats-type" label (matching the optionally supplied value)
#
# $1 optional label value
function stop_bats_containers {
	docker-compose stop
}

# delete all containers
docker_cleanup() {
	docker-compose rm -af
}

# Send a HTTP request to container $1 for path $2 and
# Additional curl options can be passed as $@
#
# $1 container name
# $2 HTTP path to query
# $@ additional options to pass to the curl command
function curl_container {
	local -r container=$1
	local -r path=$2
	shift 2
	sleep 5
	docker run --net=docker_default --label bats-type="curl" appropriate/curl --silent \
		--connect-timeout 5 \
		--max-time 20 \
		--retry 4 --retry-delay 5 \
		"$@" \
		http://$(docker_ip $container)${path}
}
