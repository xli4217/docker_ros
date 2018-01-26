#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[ 0]}" )" && pwd )"

#DOCKER_ROS_DIR="$(dirname "$DIR")"

DOCKER_DIR="$(dirname "$DIR")"

# second commandline argument is the instance name
INSTANCE_NAME=$1

# this can be cpu or gpu
ARCH=$2

xhost +local:root

if [ $ARCH == 'gpu' ]
then
    nvidia-docker run -it  --rm \
                  --env="DISPLAY"  \
                  --env="QT_X11_NO_MITSHM=1"  \
                  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
                  --workdir="/home/$USER" \
                  --volume="$DOCKER_DIR/docker_home/:/home/$USER/" \
                  --volume="/etc/group:/etc/group:ro" \
                  --volume="/etc/passwd:/etc/passwd:ro" \
                  --volume="/etc/shadow:/etc/shadow:ro" \
                  --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
                  -e LOCAL_USER_ID=`id -u $USER` \
                  -e LOCAL_GROUP_ID=`id -g $USER` \
                  -e LOCAL_GROUP_NAME=`id -gn $USER` \
                  --name $INSTANCE_NAME ros_test


elif [ $ARCH == 'cpu' ]
then
    docker run -it --rm \
           --env="DISPLAY"  \
           --env="QT_X11_NO_MITSHM=1"  \
           --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
           --workdir="/home/$USER" \
           --volume="$DOCKER_DIR/docker_home/:/home/$USER/" \
           --volume="/etc/group:/etc/group:ro" \
           --volume="/etc/passwd:/etc/passwd:ro" \
           --volume="/etc/shadow:/etc/shadow:ro" \
           --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
           -e LOCAL_USER_ID=`id -u $USER` \
           -e LOCAL_GROUP_ID=`id -g $USER` \
           -e LOCAL_GROUP_NAME=`id -gn $USER` \
           --name $INSTANCE_NAME ros_test
else
    echo "Architecture not found!"
fi


xhost -local:root
