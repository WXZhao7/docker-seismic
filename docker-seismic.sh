#!/usr/bin/env bash
# Date: 2021-08-03 15:48:44
# Author: WXZhao
# Description: run docker-seismic

# allow local connection
xhost +local: > /dev/null 2>&1

docker run -it --rm --name seismic \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -h $USER-seismic \
    -v $HOME/.Xauthority:/root/.Xauthority \
    wxzhao/seismic
    # -u $(id -u):$(id -g) \

# plan: