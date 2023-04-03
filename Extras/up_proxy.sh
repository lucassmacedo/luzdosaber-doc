#!/bin/bash

export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')

docker node update --label-add traefik-public.traefik-public-certificates=true $NODE_ID

export EMAIL=thiagooqueiroz@gmail.com

export DOMAIN=proxy.thiagoqueiroz.gq

export USERNAME=admin

export PASSWORD=DSSDSDWW####@@@

export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)

echo $HASHED_PASSWORD

curl -L dockerswarm.rocks/traefik-host.yml -o traefik-host.yml

docker stack deploy -c traefik-host.yml traefik