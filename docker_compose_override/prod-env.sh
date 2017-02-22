#!/usr/bin/env bash

###
function clean_up() {
    docker-compose stop
}
###

    docker-compose build

    docker-compose \
        -f docker-compose.yml \
        up -d

###
trap clean_up SIGINT
echo "Open http://localhost:8080 and look for 'prod environment':"
echo "Follow log output (press Ctrl + C to stop):"
###

    docker-compose logs -f
