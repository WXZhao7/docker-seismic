# Date: 2021-08-03 14:33:45
# Author: WXZhao
# Description: This DockerFile is design for seismic enviroment building

FROM ubuntu:20.04
LABEL maintainer="wxzhao7@gmail.com"
# the packages should download and save in the ./sources/temp
COPY ./sources /sources
# RUN bash /sources/install.sh && rm -rf /sources/temp
WORKDIR /
CMD ["/bin/bash"]