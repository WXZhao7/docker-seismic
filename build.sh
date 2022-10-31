#!/usr/bin/env bash

# Date: 2022-10-31 19:10:21
# Author: WXZhao
# Description: run this scrip with USER in docker group


UID=$(id -u)
GID=$(id -g)
USER=$(id -u -n)
# keep the original USER and group

cat << EOF > ./Dockerfile
FROM ubuntu:20.04
LABEL maintainer="wxzhao7@gmail.com"
# the packages should download and save in the ./sources/temp
COPY ./sources /sources
USER root
RUN groupadd -g $GID $USER && USERadd -rm -d /home/$USER -s /bin/bash -g $GID -G root -u $UID $USER
RUN bash /sources/install.sh && rm -rf /sources/temp && cp /root/.bashrc /home/$USER/.bashrc
USER $USER
WORKDIR /home/$USER
CMD ["/bin/bash"]
EOF

docker build --no-cache --rm -t seismic:latest -f ./Dockerfile .