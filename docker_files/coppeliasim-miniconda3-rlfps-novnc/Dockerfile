FROM xli4217/coppeliasim-miniconda3-novnc:latest

COPY environment_ubuntu20190920.yml /home/xli4217/rlfps_env.yml

#### Create rlfps_env in miniconda ####
RUN conda env create -f /home/xli4217/rlfps_env.yml

# need to mv all /env/rlfps_env/lib/libQt* to elsewhere and copy pyrep and cffi* to rlfps_env

