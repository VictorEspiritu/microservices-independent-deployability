eval $(docker-machine env -u)

# Build and push the images
docker-compose build
docker-compose push
