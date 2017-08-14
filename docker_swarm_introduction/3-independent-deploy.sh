#!/usr/bin/env bash

###
echo "Modify the response of the backend server a bit. Press Enter when ready"
read
###

    docker-compose build backend
    docker-compose push backend

    eval $(docker-machine env manager1)
    docker service update \
        --image "${DOCKER_HUB_USERNAME}/swarm-demo-backend:latest" \
        swarm_demo_backend

    watch docker service ps swarm_demo_backend
