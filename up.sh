#!/usr/bin/env bash

# Let the Docker client talk to the local machine
eval $(docker-machine env -u)

# Build the images
docker-compose build

# Run the containers
docker-compose up -d --force-recreate

# Show the status of the containers
docker-compose ps

# Tail and follow the container logs
docker-compose logs --follow
