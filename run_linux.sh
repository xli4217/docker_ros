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


xhost +local:root

if [ $ARCH == 'gpu' ]
then
    nvidia-docker run -it  --rm \
                  --env="DISPLAY"  \
                  --env="QT_X11_NO_MITSHM=1"  \
                  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
                  --workdir="/home/$USER" \
                  --volume=$VOLUME_MAPPING \
                  --volume="/etc/group:/etc/group:ro" \
                  --volume="/etc/passwd:/etc/passwd:ro" \
                  --volume="/etc/shadow:/etc/shadow:ro" \
                  --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
                  -e LOCAL_USER_ID=`id -u $USER` \
                  -e LOCAL_GROUP_ID=`id -g $USER` \
                  -e LOCAL_GROUP_NAME=`id -gn $USER` \
                  --name $INSTANCE_NAME $IMAGE_NAME


elif [ $ARCH == 'cpu' ]
then
    docker run -it --rm \
           --env="DISPLAY"  \
           --env="QT_X11_NO_MITSHM=1"  \
           --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
           --workdir="/home/$USER" \
           --volume=$VOLUME_MAPPING \
           --volume="/etc/group:/etc/group:ro" \
           --volume="/etc/passwd:/etc/passwd:ro" \
           --volume="/etc/shadow:/etc/shadow:ro" \
           --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
           -e LOCAL_USER_ID=`id -u $USER` \
           -e LOCAL_GROUP_ID=`id -g $USER` \
           -e LOCAL_GROUP_NAME=`id -gn $USER` \
           --name $INSTANCE_NAME $IMAGE_NAME
else
    echo "Architecture not found!"
fi


xhost -local:root
