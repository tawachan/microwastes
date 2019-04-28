VERSION=$(cat .version)
COMPOSE_FILE=docker-compose.yml

docker build . -f Dockerfile -t wastes:$VERSION

TAG=$VERSION docker stack deploy -c $COMPOSE_FILE wastes
