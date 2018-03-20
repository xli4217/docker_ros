#!/bin/bash

IMAGE=$1 # this can be "deploy" or "base" or "rlfps"
ARCH=$2 # this can be "gpu" or "cpu"
DIRS_TO_COPY_ROOT=$3 # this is required for "deploy", not necessary for "base"


if [ "$1" == "--help" ]
then
    echo "Usage: ./build.sh <deploy/base/rlfps> <gpu/cpu> <DIRS_TO_COPY_ROOT (this is required for deploy, not base)>"
    exit 0
fi

if [ $IMAGE == 'base' ]
then
    docker build --rm -t  baxter-simulation-$ARCH --build-arg USER=$USER --build-arg UID=$UID --file="baxter-simulation/base/$ARCH/Dockerfile" .

elif [ $IMAGE == 'deploy' ]
then
    docker build --rm -t  deploy-baxter-simulation-$ARCH --build-arg DIRS_TO_COPY_ROOT=$DIRS_TO_COPY_ROOT --file="baxter-simulation/deploy/$ARCH/Dockerfile" .

elif [ $IMAGE == 'rlfps' ]
then
    docker build --rm -t  rlfps-$ARCH --build-arg DIRS_TO_COPY_ROOT=$DIRS_TO_COPY_ROOT --file="rlfps-docker/$ARCH/Dockerfile" .

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
