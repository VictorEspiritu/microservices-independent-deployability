./build.sh

eval $(docker-machine env swarm-1)

docker stack deploy --compose-file ./docker-compose.yml all
