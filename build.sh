#!/bin/bash

IMAGE=$1 # this can be "deploy" or "base"
ARCH=$2 # this can be "gpu" or "cpu"
DOCKER_HOME_DIR=$3 # this is required for "deploy", not necessary for "base"


if [ "$1" == "--help" ]
then
    echo "Usage: ./build.sh <deploy/base> <gpu/cpu> <DOCKER_HOME_DIR(this is required for deploy, not base)>"
    exit 0
fi

if [ $IMAGE == 'base' ]
then
    docker build --rm -t  baxter-simulation-$ARCH --build-arg USER=$USER --build-arg UID=$UID --file="baxter-simulation/base/$ARCH/Dockerfile" .

elif [ $IMAGE == 'deploy' ]
then
    docker build --rm -t  deploy-baxter-simulation-$ARCH --build-arg DOCKER_HOME_DIR=$DOCKER_HOME_DIR --file="baxter-simulation/deploy/$ARCH/Dockerfile" .

else
    echo "image type not found"
fi
    
echo -e "-- Removing exited containers --\n"
docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm

echo -e "\n\n-- Removing untagged images --\n"
docker rmi --force $(docker images | awk '/^<none>/ { print $3 }')

# echo -e "\n\n-- Removing volume directories --\n"
# docker volume rm $(docker volume ls --quiet --filter="dangling=true")

echo -e "\n\nDone"

docker rmi $(docker images -f "dangling=true" -q)
