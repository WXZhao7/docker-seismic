#!/usr/bin/env bash
# Date: 2021-08-03 20:08:56
# Author: WXZhao
# Description: install CPS if source file existed

if [ -f "/sources/temp/CPS.tgz" ]; then
    apt-get -qq install -y libx11-dev > /dev/null

    mkdir -p /opt/CPS
    tar -xzf /sources/temp/CPS.tgz -C /opt/CPS --strip-components=1
    cd /opt/CPS
    ./Setup LINUX6440
    ./C > C.txt 2>&1
    echo 'export PATH=/opt/CPS/bin:${PATH}' >> ~/.bashrc
fi
# test
# sdisp96 -h