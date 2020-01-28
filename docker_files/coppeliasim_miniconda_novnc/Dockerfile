FROM xli4217/coppeliasim-novnc:latest

#### Install Miniconda ####
RUN cd /home/xli4217 && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -p /home/xli4217/miniconda3 -b && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH=/home/xli4217/miniconda3/bin:${PATH}

RUN conda update -y conda

#### Install PyRep under miniconda ####
RUN cd /home/xli4217/PyRep/ && \
    pip install -r requirements.txt && \
    python setup.py install 

