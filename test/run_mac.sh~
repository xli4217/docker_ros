#!/bin/bash

docker run -it \
       --rm \
       -v="/Users/xiaoli/src/docker_ros/docker_home:/home/xli4217/" \
       -v="/tmp/.X11-unix:/tmp.X11-unix:rw"\
       --env="DISPLAY"\
       --env="QT_X11_NO_MITSHM=1"\
       --name ros_test ros_test \
       rqt
export containerID=$(docker ps -l -q)
