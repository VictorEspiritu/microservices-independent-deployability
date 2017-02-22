#!/usr/bin/env bash

    # Make sure we are working with Docker on our local machine
    eval $(docker-machine env -u)

    # Build, push, connect to manager1
    docker-compose build
    docker-compose push
    eval $(docker-machine env manager1)

    # Deploy to the Swarm
    docker stack deploy --compose-file ./docker-compose.yml all_services

###
echo "Go visit http://$(docker-machine ip manager1)/"
###
