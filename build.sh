#!/usr/bin/env bash

# Date: 2022-10-31 19:10:21
# Author: WXZhao
# Description: run this scrip with user in docker group


uid=$(id -u)
gid=$(id -g)
user=$(id -u -n)
# keep the original user and group

cat << EOF > ./Dockerfile
FROM ubuntu:20.04
LABEL maintainer="wxzhao7@gmail.com"
# the packages should download and save in the ./sources/temp
COPY ./sources /sources
RUN groupadd -g ${gid} $user && useradd -rm -d /home/${user} -s /bin/bash -g ${gid} -G root -u ${uid} ${user}
USER root
RUN bash /sources/install.sh && rm -rf /sources/temp && cp /root/.bashrc /home/${user}/.bashrc
USER ${user}
WORKDIR /home/${user}
CMD ["/bin/bash"]
EOF

docker build --no-cache --rm -t seismic:latest -f ./Dockerfile .