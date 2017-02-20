#!/usr/bin/env bash

docker_compose_command="docker-compose \
    -f ./docker-compose.yml \
    -f training_management/docker-compose.yml \
    -f training_marketplace/docker-compose.yml"

# Rebuild the images
$docker_compose_command build

# Run the containers
$docker_compose_command up -d --force-recreate

# Show the status of the containers
$docker_compose_command ps

# Tail and follow the container logs
$docker_compose_command logs --follow
