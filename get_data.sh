#!/bin/bash

# convenience script to get data from other machines

pc2="gyang@192.168.1.177"
pc3="burobotics@192.168.1.233"
guangpc="burobotics@128.197.136.202"

scp -r $pc2:$HOME/Xiao/docker/docker_home/experiments/* $HOME/Xiao/docker/docker_home/experiments/

scp -r $pc3:$HOME/Xiao/docker/docker_home/experiments/* $HOME/Xiao/docker/docker_home/experiments/

scp -r $guangpc:$HOME/Xiao/docker/docker_home/experiments/* $HOME/Xiao/docker/docker_home/experiments/
