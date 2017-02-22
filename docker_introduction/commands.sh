#!/usr/bin/env bash

###
function clean_up {
	docker stop hello_world
	exit
}
###

    docker build \
        --tag hello_world_image \
        -f ./Dockerfile \
        ./

    docker run \
        --rm \
        -d \
        -p 8080:80 \
        --name hello_world \
        hello_world_image

###
trap clean_up SIGINT
echo "Follow log output (press Ctrl + C to stop):"
###

    docker logs -f hello_world
