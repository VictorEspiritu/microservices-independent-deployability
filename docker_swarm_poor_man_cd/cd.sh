#!/usr/bin/env bash

docker_compose_test="docker-compose -f docker-compose.yml -f docker-compose.test.yml"

#----------------------------------------------------
# Create and run the build container
#----------------------------------------------------
$docker_compose_test build service_build
$docker_compose_test run service_build

#----------------------------------------------------
# Create and run the code_test container
#----------------------------------------------------
$docker_compose_test build service_code_test
$docker_compose_test run service_code_test

if [[ "$?" -ne 0 ]]; then
    echo "Code tests failed"
    exit 1
fi

#----------------------------------------------------
# Create and build the service container
#----------------------------------------------------
$docker_compose_test build service
$docker_compose_test up -d service
if [[ "$?" -ne 0 ]]; then
    echo "Could not start the service"
    exit 1
fi

#----------------------------------------------------
# Create and build the image_test container
#----------------------------------------------------
$docker_compose_test build service_image_test
$docker_compose_test run service_image_test

if [[ "$?" -ne 0 ]]; then
    echo "Image tests failed"
    $docker_compose_test logs service
    exit 1
fi

$docker_compose_test stop service

#----------------------------------------------------
# Push the new image of the service
#----------------------------------------------------
$docker_compose_test push service
