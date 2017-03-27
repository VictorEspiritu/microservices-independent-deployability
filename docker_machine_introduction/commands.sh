#!/usr/bin/env bash

###
function clean_up() {
    docker stop hello_world
    docker-machine rm -y hello-world-node
    eval $(docker-machine env -u)
}
###

    docker-machine create \
        -d virtualbox \
        hello-world-node

###
trap clean_up SIGINT
echo "What is your Docker username?"
read
###

    export DOCKER_HUB_USERNAME=$REPLY

    docker build \
        -t $DOCKER_HUB_USERNAME/hello_world_image \
        -f ./Dockerfile \
        ./

    docker push $DOCKER_HUB_USERNAME/hello_world_image

    docker-machine env hello-world-node
    eval $(docker-machine env hello-world-node)

    docker pull $DOCKER_HUB_USERNAME/hello_world_image

    docker run \
        --rm \
        -d \
        -p 8080:80 \
        --name hello_world \
        $DOCKER_HUB_USERNAME/hello_world_image

###
VM_IP=$(docker-machine ip hello-world-node)
echo "Go visit http://$VM_IP:8080/"
echo "Follow log output (press Ctrl + C to stop):"
###

    docker logs -f hello_world
