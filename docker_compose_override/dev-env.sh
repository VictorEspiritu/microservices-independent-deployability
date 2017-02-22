#!/usr/bin/env bash

###
function clean_up() {
    docker-compose stop
}
###

    docker-compose build
    docker-compose up -d

###
trap clean_up SIGINT
echo "Open http://localhost:8080 and look for 'dev environment':"
echo "Follow log output (press Ctrl + C to stop):"
###

    docker-compose logs -f
