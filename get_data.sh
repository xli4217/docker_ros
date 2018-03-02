#!/bin/bash

# convenience script to get data from other machines

pc2="gyang@192.168.1.177"
pc3="burobotics@192.168.1.233"
guangpc="burobotics@128.197.136.202"

sudo scp -r $pc2:/home/gyang/Xiao/docker/docker_home/experiments/* $HOME/Xiao/docker/docker_home/experiments/

sudo scp -r $pc3:$HOME/Xiao/docker/docker_home/experiments/* $HOME/Xiao/docker/docker_home/experiments/

sudo scp -r $guangpc:$HOME/Xiao/docker/docker_home/experiments/* $HOME/Xiao/docker/docker_home/experiments/
