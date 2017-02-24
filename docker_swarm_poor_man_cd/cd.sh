#!/usr/bin/env bash

# Exit this script upon the first failing command
set -e

# Run with local Docker Engine
eval $(docker-machine env -u)

#----------------------------------------------------
# Build the test container and run the tests
#----------------------------------------------------
docker_compose_test="docker-compose -f docker-compose.test.yml"
$docker_compose_test build
$docker_compose_test run test

#----------------------------------------------------
# Build the build container and run the build
#----------------------------------------------------
docker_compose_build="docker-compose -f docker-compose.build.yml"
$docker_compose_build build
$docker_compose_build run build
docker build -t matthiasnoback/service:latest build/service/docker

#----------------------------------------------------
# Build the integration containers and start them
#----------------------------------------------------
docker_compose_integration="docker-compose -f docker-compose.integration.yml"
$docker_compose_integration build
$docker_compose_integration up -d

#----------------------------------------------------
# Run integration tests and stop all services
#----------------------------------------------------
$docker_compose_integration run integration test
$docker_compose_integration stop

#----------------------------------------------------
# Push the new image of the service
#----------------------------------------------------
docker push matthiasnoback/service:latest

#----------------------------------------------------
# Deploy
#----------------------------------------------------

eval $(docker-machine env manager1)

# Deploy to the Swarm
docker stack deploy \
    --compose-file ./docker-compose.production.yml \
    cd_demo

###
echo "Visit the newly deployed service at http://$(docker-machine ip manager1)/"
echo "Press enter to start watching the deploy process"
read
###

watch docker stack ps cd_demo
