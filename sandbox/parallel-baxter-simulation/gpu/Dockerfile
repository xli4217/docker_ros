# A Dockerfile for the gym-gazebo environment
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04

#################
# General setup #
#################

# Set arguments
ARG USER=xli4217
ARG GROUP=${USER}
ARG UID=1000
ARG TENSORFLOW_ARCH=cpu
ARG TENSORFLOW_VERSION=1.5.0rc0

# Set environment variables
ENV HOSTNAME localhost
ENV HOME /home/${USER}
ENV USER ${USER}

# Set working directory
WORKDIR "/home/${USER}"

# Get the dependencies
RUN apt-get update \
    && apt-get install -y xorg-dev \
    libgl1-mesa-dev \
    xvfb \
    libxinerama1 \
    libxcursor1 \
    unzip \
    libglu1-mesa \
    libav-tools \
    python-numpy \
    python-scipy \
    python-pyglet \
    python-setuptools \
    libpq-dev \
    libjpeg-dev \
    wget \
    curl \
    cmake \
    git \
    nano vim \
    locales \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && easy_install pip

RUN apt-get update && \
    apt-get install -y python3-pip


#################
# install tools #
#################
RUN apt-get update && apt-get install -y emacs24 \
                                         terminator \
                                         wget \
                                         net-tools \
                                         mesa-utils \
                                         htop \
                                         iputils-ping


###############
# install ros #
###############

# setup environment
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list

# setup key
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# install ROS kinectic
RUN apt-get update && apt-get install -y \
    ros-kinetic-desktop-full 

# install rosdep
RUN rosdep init \
    && rosdep update    
 
RUN apt-get install -y ros-kinetic-gazebo-ros-pkgs \
                       ros-kinetic-qt-build \
                       ros-kinetic-gazebo-ros-control\
                       ros-kinetic-ros-control\
                       ros-kinetic-control-toolbox\
                       ros-kinetic-realtime-tools\
                       ros-kinetic-ros-controllers\
                       ros-kinetic-xacro\
                       python-wstool\
                       ros-kinetic-tf-conversions\
                       ros-kinetic-kdl-parser\
                       ros-kinetic-moveit
        


# Putting stuff in bashrc
RUN echo "source /opt/ros/kinetic/setup.bash" >> /root/.bashrc && \
    echo "alias em='emacs -nw'" >> /root/.bashrc && \
    echo "source $HOME/rlfps/setup_pythonpath.sh" >> /root/.bashrc


# install gazebo and dependencies
RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable xenial main" > /etc/apt/sources.list.d/gazebo-stable.list
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
RUN apt-get update && apt-get install -y gazebo7 libgazebo7-dev

# -------------------------------------------
# dependency for baxter bridge
# -------------------------------------------
RUN pip install zmq protobuf
RUN pip3 install zmq protobuf

# ---------------------------------------------
# installing tensorflow for python3
# ---------------------------------------------
RUN pip3 install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.2.1-cp35-cp35m-linux_x86_64.whl 


########
# Misc #
########

ENV PYTHONPATH /home/baxter_bridge:${PYTHONPATH}
# do not use gpu
ENV CUDA_VISIBLE_DEVICES=4 

# Source setup.bash
SHELL ["/bin/bash", "-c"]
RUN source /root/.bashrc
