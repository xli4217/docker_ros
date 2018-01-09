#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[ 0]}" )" && pwd )"

DOCKER_ROS_DIR="$(dirname "$DIR")"

DOCKER_DIR="$(dirname "$DOCKER_ROS_DIR")"


xhost +local:root


nvidia-docker run -it --rm \
--env="DISPLAY"  \
--env="QT_X11_NO_MITSHM=1"  \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--workdir="/home/$USER" \
--volume="/home/$USER:/home/$USER" \
--volume="/etc/group:/etc/group:ro" \
--volume="/etc/passwd:/etc/passwd:ro" \
--volume="/etc/shadow:/etc/shadow:ro" \
--volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
-e LOCAL_USER_ID=`id -u $USER` \
-e LOCAL_GROUP_ID=`id -g $USER` \
-e LOCAL_GROUP_NAME=`id -gn $USER` \
--name ros_test ros_test

#--volume="$DOCKER_DIR/docker_home/:/home/$USER/" \

# docker run -it \
#        --rm \
#        --privileged \
#        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"\
#        --volume="$DOCKER_DIR/docker_home/:/home/$USER/" \
#        --env="DISPLAY"\
#        --env="QT_X11_NO_MITSHM=1"\
#        --name ros_test ros_test

#--env="QT_X11_NO_MITSHM=1"\

# docker run -it \
#        --rm \
#        --volume="/etc/group:/etc/group:ro"\
#        --volume="/etc/passwd:/etc/passwd:ro" \
#        --volume="/etc/shadow:/etc/shadow:ro" \
#        --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
#        --volume="/tmp/.X11-unix:/tmp.X11-unix:rw"\
#        --env="DISPLAY:$DISPLAY"\
#        --env="QT_X11_NO_MITSHM=1"\   
#        --volume="$DOCKER_DIR/docker_home/:/home/$USER/" \
#        --name ros_test ros_test


# export containerID=$(docker ps -l -q)
# docker start $containerID

xhost -local:root
