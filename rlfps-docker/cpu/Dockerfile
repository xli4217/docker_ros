# Download base image
FROM ubuntu:16.04

MAINTAINER Xiao Li <xli87@bu.edu>

# Set arguments
ARG DIRS_TO_COPY_ROOT=dirs-to-copy
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

#################
# Use Python 3 #
################
RUN apt-get update \
    && apt-get install -y python3-pip python3-dev swig\
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip


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
                                         python-tk \
                                         tmux \
                                         build-essential \             
                                         curl \
                                         libfreetype6-dev \
                                         libpng12-dev \
                                         libzmq3-dev \
                                         pkg-config \
                                         python \
                                         python-dev \
                                         rsync \
                                         software-properties-common \
                                         unzip \
                                         git \
                                         python3-tk \
                                         #xvfb \
                                         #xorg \
                                         ffmpeg && \
                                         apt-get clean
                                         #rm -rf /var/lib/apt/lists/*


######################
# Install Tensorflow #
######################

# Pick up some TF dependencies
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     build-essential \             
#     curl \
#     libfreetype6-dev \
#     libpng12-dev \
#     libzmq3-dev \
#     pkg-config \
#     python \
#     python-dev \
#     rsync \
#     software-properties-common \
#     unzip \
#     ffmpeg && \
#     apt-get clean
#     rm -rf /var/lib/apt/lists/*


RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN pip install pybullet

RUN pip --no-cache-dir install \
        Pillow \
        h5py \
        ipykernel \
        jupyter \
        matplotlib \
        numpy \
        pandas \
        scipy \
        sklearn \
        joblib \
        plotly \
        gym \
        pydot \
        pydotplus \
        visdom \          
        antlr4-python3-runtime \
        cloudpickle \
        scikit-optimize \
        tools \
        fire \
        box2d \
        ai2thor \
        networkx==1.11 \
        && \             
   python -m ipykernel.kernelspec

RUN pip install tensorflow

###########
# AI2Thor #
###########
# RUN apt-get update && apt-get -y upgrade
# RUN apt-get -y install xserver-xorg-core \
#                        xserver-xorg-video-dummy \
#                        libxcursor1 \
#                        x11vnc \
#                        unzip \
#                        pciutils \
#                        software-properties-common \
#                        kmod \
#                        gcc \
#                        make \
#                        linux-headers-generic\
#                        wget



###############
# Install Ray #
###############
RUN pip install ray


################
# Install Spot # 
################
# RUN wget http://www.lrde.epita.fr/dload/spot/spot-2.5.3.tar.gz && \
#     tar -xzf spot-2.5.3.tar.gz && \
#     cd spot-2.5.3 && \
#     ./configure && make && make install

RUN wget -q -O - https://www.lrde.epita.fr/repo/debian.gpg | apt-key add - && \
    echo 'deb http://www.lrde.epita.fr/repo/debian/ stable/' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install spot libspot-dev spot-doc python3-spot # Or a subset of those

########
# Misc #
########
# Expose ports for Tensorboard (6006), Ipython (8888), ROS (11311)
# EXPOSE 6006 8888 11311
EXPOSE 5000-60000


# Putting stuff in bashrc
RUN echo "alias em='emacs -nw'" >> /root/.bashrc && \
    echo "source $HOME/rlfps/setup_pythonpath.sh" >> /root/.bashrc

# copy bashrc
RUN cp /root/.bashrc /home/${USER}/.bashrc && \
    mkdir /home/${USER}/rlfps/

# Copy docker_home folder to home directory
# COPY ${DIRS_TO_COPY_ROOT}/rlfps/ /home/${USER}/rlfps/

# run the job
# CMD ["/bin/bash", "${HOME}/rlfps/scripts/run_job_baxter.sh"]



