#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[ 0]}" )" && pwd )"

#DOCKER_ROS_DIR="$(dirname "$DIR")"

DOCKER_DIR="$(dirname "$DIR")"

# second commandline argument is the instance name
INSTANCE_NAME=$1

# this can be cpu or gpu
ARCH=$2

xhost +local:root

nvidia-docker run -it --rm -e="DISPLAY" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" parallel-baxter

xhost -local:root
