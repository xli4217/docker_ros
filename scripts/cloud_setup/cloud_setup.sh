#!/bin/bash

sudo apt-get update

sudo apt-get install python-pip python-dev build-essential

sudo apt-get install -y git tmux emacs24 htop

# clone emacs configs and set up
cd $HOME
git clone https://github.com/xli4217/emacs-config.git
cp emacs-config/dotemacs ./.emacs
cp -r emacs-config/dotemacsdotd ./.emacs.d

# clone rlfps
git clone https://github.com/xli4217/rlfps.git

# install docker
sh ./get-docker.sh

# test docker
sh ./test-docker.sh


