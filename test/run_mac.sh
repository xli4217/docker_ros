#!/bin/bash

# For getting gui on mac, doesn't work
# ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
# xhost + $ip
#-v="/tmp/.X11-unix:/tmp.X11-unix:rw"\
#--env="DISPLAY=${ip}:0"\
#export containerID=$(docker ps -l -q)

docker run -it \
       --rm \
       -v="/Users/xiaoli/src/docker_home:/home/xli4217/" \
       -w="/home/xli4217" \
       --name ros_test ros_test \
   

