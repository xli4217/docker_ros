FROM ubuntu:16.04

MAINTAINER Xiao Li <xli87@bu.edu>

# Set arguments
ARG USER=xli4217
ARG GROUP=${USER}

# Set environment variables
ENV HOSTNAME localhost
ENV HOME /home/${USER}
ENV USER ${USER}

# Set working directory
WORKDIR "/home/${USER}"

#################
# install tools #
#################
RUN apt-get update && apt-get install -y emacs24 \
                                         terminator \
                                         wget \
                                         net-tools \
                                         mesa-utils \
                                         htop \
                                         iputils-ping \
                                         tmux \
                                         build-essential \             
                                         curl \
                                         libfreetype6-dev \
                                         libpng12-dev \
                                         pkg-config \
                                         software-properties-common \
                                         unzip \
                                         git \
                                         && apt-get autoclean \
                                         && apt-get autoremove \
                                         && rm -rf /var/lib/apt/lists/*

#### Install Python ####
RUN apt-get install -y python-pip python-dev build-essential

########
# Misc #
########
EXPOSE 5000-60000
