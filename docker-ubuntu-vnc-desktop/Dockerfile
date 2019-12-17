FROM xli4217/docker-vnc-ros-kinetic-full:latest

# ENV PATH /root/miniconda3/env/robot_cooking:$PATH
# ENV PYTHONPATH /root/miniconda3/env/robot_cooking/lib/python3.7/site-packages/:$PYTHONPATH

RUN /root/miniconda3/envs/robot_cooking/bin/pip install pathlib sacred ray jedi parsing virtualenv 

# Copy docker_home folder to home directory
COPY dirs-to-copy/emacs_config/dotemacs ${HOME}/.emacs
COPY dirs-to-copy/emacs_config/dotemacsdotd ${HOME}/.emacs.d
