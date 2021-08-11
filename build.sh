#!/usr/bin/env bash
# Date: 2021-08-09 14:32:56
# Author: WXZhao
# Description: build docker image

docker build --no-cache --rm -t seismic:latest -f ./Dockerfile .