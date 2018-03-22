#!/bin/bash

script_dir="$( cd "$(dirname "$0")" ; pwd -P )"

sudo apt-get update

sudo apt-get install -y python-pip python-dev build-essential

sudo apt-get install -y git tmux emacs24 htop

# clone emacs configs and set up
cd $HOME
git clone https://github.com/xli4217/emacs-config.git
cp emacs-config/dotemacs ./.emacs
cp -r emacs-config/dotemacsdotd ./.emacs.d

echo "alias em='emacs -nw'" >> $HOME/.bashrc

# clone rlfps
git clone https://github.com/xli4217/rlfps.git
echo "source $HOME/rlfps/setup_pythonpath.sh" >> $HOME/.bashrc

source $HOME/.bashrc


# install docker for ubuntu 16.04  (instructions from https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1)
sudo usermod -aG docker $USER # add user to docker group so don't have to sudo docker everytime
sudo apt-get remove docker docker-engine docker.io # remove existing docker

sudo apt-get update

sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
        "deb [ arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce

# verify docker 
sudo docker run hello-world

### or can use these two scripts for other distros #####
#cd $script_dir
#sh get-docker.sh
#sh test-docker.sh

# pull rlfps docker
sudo docker login --username=xli421
sudo docker pull xli4217/rlfps-cpu
