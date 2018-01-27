#!/bin/bash

# convenience script to push or pull necessary packages


CMD=$1 # this can be push or pull
WS=$2

if [ $CMD == 'push' ] #&& [ $WS == 'baxter_ws' ]
then
    ###############
    #  Push rlfps #
    ###############
    echo "#### Pushing rlfps ####"
    cd rlfps
    git add -A
    git commit -m "update"
    git push origin rlfps3

    ###################
    # Push docker_ros #
    ###################
    echo "#### Pushing docker_ros ####"
    cd ../../docker_ros
    git add -A
    git commit -m "update"
    git push origin master

    #####################
    # push baxter stuff #
    #####################
    echo "#### going into $WS ####"
    cd ../docker_home/$WS
    WS_HOME=$PWD
    
    # push baxter_api
    echo "#### Pushing baxter_api ####"
    cd $WS_HOME/src/baxter_learn_pkgs/baxter_api
    git add -A
    git commit -m "update"
    git push origin master

    # push baxter_learn
    echo "#### Pushing baxter_learn ####"
    cd $WS_HOME/src/baxter_learn_pkgs/baxter_learn
    git add -A
    git commit -m "update"
    git push origin master

    
elif [ $ARCH == 'pull' ]
then
    
    ###############
    #  Pull rlfps #
    ###############
    echo "#### Pulling rlfps ####"
    cd rlfps
    git add -A
    git commit -m "update"
    git pull origin rlfps3

    ###################
    # Pull docker_ros #
    ###################
    echo "#### Pushing docker_ros ####"
    cd ../../docker_ros
    git pull origin master

    #####################
    # Pull baxter stuff #
    #####################
    echo "going into $WS"
    cd ../docker_home/$WS
    WS_HOME=$PWD

    # push baxter_api
    echo "#### Pulling baxter_api ####"
    cd $WS_HOME/src/baxter_learn_pkgs/baxter_api
    git pull origin master

    # push baxter_learn
    echo "#### Pulling baxter_learn ####"
    cd $WS_HOME/src/baxter_learn_pkgs/baxter_learn
    git push pull master

    
else
    echo "command not found!"
fi
