#!/usr/bin/env bash

./build.sh

# Run the containers
docker-compose up -d --force-recreate

# Show the status of the containers
docker-compose ps

# Tail and follow the container logs
docker-compose logs --follow
