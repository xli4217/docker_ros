#!/bin/bash

ARCH=$1 # this can be "gpu" or "cpu"

docker build --rm -t  baxter-simulation --build-arg USER=$USER --build-arg UID=$UID --file="baxter-simulation/$ARCH/Dockerfile" .

echo -e "-- Removing exited containers --\n"
docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm

echo -e "\n\n-- Removing untagged images --\n"
docker rmi --force $(docker images | awk '/^<none>/ { print $3 }')

# echo -e "\n\n-- Removing volume directories --\n"
# docker volume rm $(docker volume ls --quiet --filter="dangling=true")

echo -e "\n\nDone"

docker rmi $(docker images -f "dangling=true" -q)
