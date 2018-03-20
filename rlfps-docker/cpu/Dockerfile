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
# install tools #
#################
RUN apt-get update && apt-get install -y emacs24 \
                                         terminator \
                                         wget \
                                         net-tools \
                                         mesa-utils \
                                         htop \
                                         iputils-ping \
                                         tmux


######################
# Install Tensorflow #
######################

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
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
    unzip && \
    apt-get clean
    # rm -rf /var/lib/apt/lists/*


RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

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
        cloudpickle \
        scikit-optimize \
        pybullet \
        tools \
        && \           
   python -m ipykernel.kernelspec

###############
# Install Ray #
###############
RUN pip install ray

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
# CMD ["/bin/bash", "/root/rlfps/scripts/run_job_baxter.sh"]



