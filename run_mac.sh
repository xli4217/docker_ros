#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[ 0]}" )" && pwd )"

#DOCKER_ROS_DIR="$(dirname "$DIR")"

DOCKER_DIR="$(dirname "$DIR")"

# this is the image name
IMAGE_NAME=$1

# this  is the instance name
INSTANCE_NAME=$2

# this can be cpu or gpu
ARCH=$3

# this can be "base" or "deploy"
IMAGE_TYPE=$4

BASE_VOLUME_MAPPING="$DOCKER_DIR/docker_home/:/home/$USER/"
DEPLOY_VOLUME_MAPPING="$DOCKER_DIR/experiments/:/root/experiments/"

if [ $IMAGE_TYPE == "base" ]
then
    VOLUME_MAPPING=$BASE_VOLUME_MAPPING
else
    VOLUME_MAPPING=$DEPLOY_VOLUME_MAPPING
fi

if [ $ARCH == 'gpu' ]
then
    nvidia-docker run -it  --rm \
                  --volume=$VOLUME_MAPPING \
                  --name $INSTANCE_NAME $IMAGE_NAME


elif [ $ARCH == 'cpu' ]
then
    docker run -it --rm \
           --volume=$VOLUME_MAPPING \
           --name $INSTANCE_NAME $IMAGE_NAME
else
    echo "Architecture not found!"
fi


# docker run -it \
#        --rm \
#        -v="$DOCKER_DIR/docker_home/:/home/xli4217/" \
#        -w="/home/xli4217" \
#        --name ros_test1 ros_test \
   

