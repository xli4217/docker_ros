# Download base image
FROM ubuntu:16.04

MAINTAINER Xiao Li <xli87@bu.edu>

# Set arguments
ARG USER=xli4217
ARG GROUP=${USER}
ARG UID=1000
ARG TENSORFLOW_ARCH=cpu
ARG DIRS_TO_COPY_ROOT=dirs-to-copy

# Set environment variables
ENV HOSTNAME localhost
ENV HOME /home/${USER}
ENV USER ${USER}

# Set working directory
WORKDIR "/home/${USER}"

# Copy VRep
COPY ${DIRS_TO_COPY_ROOT}/V-REP/ /home/V-REP/

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
                                         python-pip \
                                         rsync \                                    
                                         software-properties-common \
                                         unzip \
                                         git \
                                         python3-tk \
                                         xvfb \
                                         #xorg \
                                         ffmpeg && \
                                         apt-get clean
                                         #rm -rf /var/lib/apt/lists/*


######################
# Install Tensorflow #
######################

RUN pip install --upgrade pip

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
        pydot \
        pydotplus \
        antlr4-python3-runtime \
        cloudpickle \
        scikit-optimize \
        tools \
        fire \
        networkx==1.11 \
        && \             
   python -m ipykernel.kernelspec

RUN pip install tensorflow \
                ray

########
# Misc #
########
EXPOSE 5000-60000

# Putting stuff in bashrc
RUN echo "alias em='emacs -nw'" >> /root/.bashrc && \
    echo "source $HOME/rlfps/setup_pythonpath.sh" >> /root/.bashrc

# copy bashrc
RUN cp /root/.bashrc /home/${USER}/.bashrc && \
    mkdir /home/${USER}/rlfps/
