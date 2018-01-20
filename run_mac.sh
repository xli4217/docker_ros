#!/bin/bash

# For getting gui on mac, doesn't work
# ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
# xhost + $ip
#-v="/tmp/.X11-unix:/tmp.X11-unix:rw"\
#--env="DISPLAY=${ip}:0"\
#export containerID=$(docker ps -l -q)

# DIR is the directory of the current file
DIR="$( cd "$( dirname "${BASH_SOURCE[ 0]}" )" && pwd )"

DOCKER_ROS_DIR="$(dirname "$DIR")"

DOCKER_DIR="$(dirname "$DOCKER_ROS_DIR")"

docker run -it \
       --rm \
       -v="$DOCKER_DIR/docker_home/:/home/xli4217/" \
       -w="/home/xli4217" \
       --name ros_test1 ros_test \
   

