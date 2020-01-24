# Download base image
FROM xli4217/baxter-simulation-cpu

MAINTAINER Xiao Li <xli87@bu.edu>

# Set arguments
ARG DOCKER_HOME_DIR=docker_home

WORKDIR /root

# Copy docker_home folder to home directory
COPY ${DOCKER_HOME_DIR} /root/

RUN cd /root/baxter_ws && \
    rm -rf build && \
    rm -rf devel

RUN cd /root/ && \
    mkdir experiments

# Source scripts and build baxter_ws
SHELL ["/bin/bash", "-c"]
RUN source /opt/ros/kinetic/setup.bash && \
    cd /root/baxter_ws && \
    catkin_make

# run the job
CMD ["/bin/bash", "/root/rlfps/scripts/run_job_baxter.sh"]



