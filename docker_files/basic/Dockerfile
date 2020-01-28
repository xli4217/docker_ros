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
RUN apt-get update \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
    python3.7 \
    python3-pip \
    python3-dev \
    python \
    python-pip \
    python-dev \
    && rm -rf /var/lib/apt/lists/*

#### Use Python 3 ####
RUN cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip


########
# Misc #
########
EXPOSE 5000-60000
