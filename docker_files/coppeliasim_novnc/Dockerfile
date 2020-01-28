FROM xli4217/basic-novnc:latest

RUN mkdir /home/xli417/

#### Copy CoppeliaSim and PyRep ####
COPY dirs-to-copy/CoppeliaSim_Edu_V4_0_0_Ubuntu16_04 /home/xli4217/CoppeliaSim_Edu_V4_0_0_Ubuntu16.04/
COPY dirs-to-copy/PyRep /home/xli4217/PyRep/

#### Install PyRep ####
RUN apt-get update && apt-get install -y --no-install-recommends xvfb \
                                                                 apt-utils \
                                                                 libxkbcommon-x11-0 \
                                                                 libavcodec-dev \
                                                                 libavformat-dev \
                                                                 libswscale-dev \
                                                                 python3-setuptools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

                                                                 # libglib2.0-0 \
                                                                 # libgl1-mesa-glx \
                                                                 # xcb \
                                                                 # "^libxcb.*" \
                                                                 # libx11-xcb-dev \
                                                                 # libglu1-mesa-dev \
                                                                 # libxrender-dev \
                                                                 # libxi6 \
                                                                 # libdbus-1-3 \
                                                                 # libfontconfig1 \                                          
                                                                 
  
                                                                


RUN echo "export COPPELIASIM_ROOT=/home/xli4217/CoppeliaSim_Edu_V4_0_0_Ubuntu16.04/" >> /root/.bashrc && \
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/xli4217/CoppeliaSim_Edu_V4_0_0_Ubuntu16.04/" >> /root/.bashrc && \
    echo "export QT_QPA_PLATFORM_PLUGIN_PATH=/home/xli4217/CoppeliaSim_Edu_V4_0_0_Ubuntu16.04/" >> /root/.bashrc
   
### this is for installation
ENV COPPELIASIM_ROOT=/home/xli4217/CoppeliaSim_Edu_V4_0_0_Ubuntu16.04/
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${COPPELIASIM_ROOT}
ENV QT_QPA_PLATFORM_PLUGIN_PATH=${COPPELIASIM_ROOT}

RUN cd /home/xli4217/PyRep/ && \
    pip3 install -r requirements.txt && \
    python3 setup.py install 

