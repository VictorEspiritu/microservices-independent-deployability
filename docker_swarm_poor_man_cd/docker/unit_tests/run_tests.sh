#!/usr/bin/env bash

# Fail script upon first failed command
set -e

BUILD_DIRECTORY=build/unit_tests

# Copy the code to a new directory
rm -r $BUILD_DIRECTORY 2> /dev/null || true
mkdir -p $BUILD_DIRECTORY
cp -R app $BUILD_DIRECTORY/

APP_DIRECTORY=$BUILD_DIRECTORY/app
cd $APP_DIRECTORY

# Install dev dependencies
composer install \
    --prefer-dist

# Run unit tests
vendor/bin/phpunit
