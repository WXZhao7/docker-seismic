#!/usr/bin/env bash
# Date: 2022-10-31 20:27:40
# Author: WXZhao
# Description: run the container

# allow local connection
xhost +local: > /dev/null 2>&1

# computer path
from=~/temp/ahaha
# docker container path
to=/home/$(id -u -n)/data

function run(){
    docker run -it --rm --name seismic \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -h docker \
    -v $HOME/.Xauthority:/root/.Xauthority \
    -v ${from}:${to} \
    -u $(id -u) \
    seismic:latest
}

if [ ! "$(docker ps -q -f name=^seismic$)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=^seismic$)" ]; then
        # cleanup
        docker rm seismic
    fi
    run
fi