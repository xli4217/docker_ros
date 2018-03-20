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

# this can be "base" or "deploy" or "rlfps"
IMAGE_TYPE=$4

RLFPS_VOLUME_MAPPING_HOST_DIR=$5

if [ "$1" == "--help" ]
then
    echo "Usage: ./run_linux.sh <image_name> <instance_name> <cpu/gpu> <base/deploy/rlfps> <host dir to map rlfps/experiments>"
    exit 0
fi


BASE_VOLUME_MAPPING="$DOCKER_DIR/docker_home/:/home/$USER/"
DEPLOY_VOLUME_MAPPING="$DOCKER_DIR/experiments/:/root/experiments/"
RLFPS_VOLUME_MAPPING="$RLFPS_VOLUME_MAPPING_HOST_DIR:/home/"


if [ $IMAGE_TYPE == "base" ] 
then
    VOLUME_MAPPING=$BASE_VOLUME_MAPPING
elif [ $IMAGE_TYPE == "rlfps" ]
then
    VOLUME_MAPPING=$RLFPS_VOLUME_MAPPING
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
   

