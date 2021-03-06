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
echo "Open http://localhost:8080, make changes to web/index.php and see the web page change too:"
echo "Follow log output (press Ctrl + C to stop):"
###

    docker-compose logs -f
