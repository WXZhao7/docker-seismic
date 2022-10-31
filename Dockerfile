# Date: 2021-08-03 14:33:45
# Author: WXZhao
# Description: This DockerFile is design for seismic enviroment building

FROM ubuntu:20.04
LABEL maintainer="wxzhao7@gmail.com"
# ARG USER=seismic
# ARG GROUP=seismic
# ARG PASSWORD=seismic
# RUN useradd --create-home --no-log-init --shell /bin/bash $USER \
#     && adduser $USER sudo \
#     && echo $USER:$PASSWORD | chpasswd
# install fixuid
# RUN USER=docker && \
#     && \
#     curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.4.1/fixuid-0.4.1-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
#     chown root:root /usr/local/bin/fixuid && \
#     chmod 4755 /usr/local/bin/fixuid && \
#     mkdir -p /etc/fixuid && \
#     printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml
COPY ./sources /sources
RUN bash /sources/install.sh && rm -rf /sources/temp
WORKDIR /
# USER $USER
# ENTRYPOINT ["fixuid"]
CMD ["/bin/bash"]