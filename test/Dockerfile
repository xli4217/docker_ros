# Download base image
FROM osrf/ros:kinetic-desktop-full-xenial

MAINTAINER Xiao Li <xli87@bu.edu>

# Set arguments
ARG USER=xli4217
ARG TENSORFLOW_ARCH=cpu
ARG TENSORFLOW_VERSION=1.5

# Set environment variables
#ENV HOSTNAME localhost
ENV HOME /home/${USER}

# Set working directory
WORKDIR "/home/${USER}"

# update software repo
RUN apt-get update

# install tools
RUN apt-get install -y emacs24 \
                       terminator \
                       wget 
# update gcc
RUN apt-get install -y  build-essential software-properties-common && \
                        add-apt-repository ppa:ubuntu-toolchain-r/test && \
                        apt-get update && \
                        apt-get install gcc-6 g++-6 -y && \
                        update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6
                        # apt-get update && \
                        # apt-get install gcc-snapshot -y && \
                        # apt-get install gcc-4.8 g++-4.8 -y && \
                        # update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8;

RUN update-alternatives --config gcc

# install ros packages
RUN apt-get install -y ros-kinetic-gazebo-ros-pkgs \
                       ros-kinetic-qt-build \
                       ros-kinetic-gazebo-ros-control\
                       ros-kinetic-gazebo-ros-pkgs\
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
    echo "source $HOME/baxter_ws/src/baxter_learn_pkgs/rlfps/setup_pythonpath.sh" >> /root/.bashrc
    
# copy bashrc
# COPY /root/.bashrc /home/${USER}/.bashrc

# Expose ports for Tensorboard (6006), Ipython (8888)
EXPOSE 6006 8888

# Source setup.bash
#CMD ['source', '/opt/ros/kinetic/setup.bash']
