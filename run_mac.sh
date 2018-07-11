#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[ 0]}" )" && pwd )"

#DOCKER_ROS_DIR="$(dirname "$DIR")"

DOCKER_DIR="$(dirname "$DIR")"


# this can be "base" or "deploy" or "rlfps"
IMAGE_TYPE=$1

# this can be cpu or gpu
ARCH=$2

# this  is the instance name
INSTANCE_NAME=$3

RLFPS_VOLUME_MAPPING=$4


if [ $IMAGE_TYPE == "base" ]
then
    IMAGE_NAME="xli4217/baxter-simulation-$ARCH"
elif [ $IMAGE_TYPE == "deploy" ]
then
    IMAGE_NAME="xli4217/deploy-baxter-simulation-$ARCH"
elif [ $IMAGE_TYPE == "vrep" ]
then
    IMAGE_NAME="xli4217/vrep-$ARCH"
elif [ $IMAGE_TYPE == "rlfps" ]
then
    IMAGE_NAME="xli4217/rlfps-$ARCH"
else
    echo "invalid IMAGE_NAME"
fi


if [ "$1" == "--help" ]
then
    echo "Usage: ./run_linux.sh <base/deploy/rlfps> <cpu/gpu> <instance name> <volume mapping from in format host_dir:image_dir (currently only for rlfps)>"
    exit 0
fi


#BASE_VOLUME_MAPPING="$DOCKER_DIR/docker_home/:/home/$USER/"
BASE_VOLUME_MAPPING=$4
DEPLOY_VOLUME_MAPPING="$DOCKER_DIR/experiments/:/root/experiments/"

if [ $IMAGE_TYPE == "base" ] 
then
    VOLUME_MAPPING=$BASE_VOLUME_MAPPING
elif [ $IMAGE_TYPE == "rlfps" ]
then
    VOLUME_MAPPING=$RLFPS_VOLUME_MAPPING
elif [ $IMAGE_TYPE == "vrep" ]
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
    ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    xhost + $ip
    docker run -it --rm \
           --volume=$VOLUME_MAPPING \
           --shm-size=8g \
           -e DISPLAY=$ip:0 \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --privileged \
           --name $INSTANCE_NAME $IMAGE_NAME
else
    echo "Architecture not found!"
fi

xhost - $ip

# docker run -it \
#        --rm \
#        -v="$DOCKER_DIR/docker_home/:/home/xli4217/" \
#        -w="/home/xli4217" \
#        --name ros_test1 ros_test \
   

