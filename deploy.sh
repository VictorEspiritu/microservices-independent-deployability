./build.sh

# Let the Docker client talk to the local machine
eval $(docker-machine env -u)

# Push the container images to Docker Hub
docker-compose push

# Let the Docker client talk to the Swarm manager
eval $(docker-machine env swarm-1)

# Deploy to the Swarm
docker stack deploy --compose-file ./docker-compose.yml all_services
