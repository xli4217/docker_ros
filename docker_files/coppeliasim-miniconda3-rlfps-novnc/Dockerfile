FROM xli4217/coppeliasim-miniconda3-novnc:latest

#### Create rlfps_env in miniconda ####
COPY rlfps_env.yml /home/xli4217/rlfps_env.yml
RUN conda env create -f /home/xli4217/rlfps_env.yml

#### Make PyRep work in miniconda3 ####
# need to mv all /env/rlfps_env/lib/libQt* to elsewhere and copy pyrep and cffi* to rlfps_env
RUN cd /home/xli4217/miniconda3/envs/rlfps_env/lib/ && \
    mkdir tmp_libQt && \
    mv libQt* tmp_libQt && \
    cp -r /home/xli4217/miniconda3/lib/python3.7/site-packages/pyrep /home/xli4217/miniconda3/envs/rlfps_env/lib/python3.7/site-packages/ && \
    cp -r /home/xli4217/miniconda3/lib/python3.7/site-packages/cffi* /home/xli4217/miniconda3/envs/rlfps_env/lib/python3.7/site-packages/

#### Install spot ####
RUN cd /home/xli4217/ && \
    wget http://www.lrde.epita.fr/dload/spot/spot-2.8.5.tar.gz && \
    tar -xvf spot-2.8.5.tar.gz && \
    rm spot-2.8.5.tar.gz && \
    cd spot-2.8.5 && \
    ./configure && \
    make && \
    make install

### make sure spot can be imported by rlfps_env
RUN mv /usr/local/lib/lib* /usr/lib/ && \
    mv /usr/local/lib/python3.7/site-packages/_budd* /home/xli4217/miniconda3/envs/rlfps_env/lib/python3.7/site-packages/ && \
    mv /usr/local/lib/python3.7/site-packages/buddy.py /home/xli4217/miniconda3/envs/rlfps_env/lib/python3.7/site-packages/ && \
    mv /usr/local/lib/python3.7/site-packages/spot /home/xli4217/miniconda3/envs/rlfps_env/lib/python3.7/site-packages/ 

#### Install Gurobi (this requires activation on a school network) ####

#### Install addtional python packages ####
RUN pip install ray sacred
