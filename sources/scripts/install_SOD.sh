#!/usr/bin/env bash
# Date: 2021-08-04 21:33:39
# Author: WXZhao
# Description: download and install SOD

if [ ! -f "/sources/temp/sod.tgz" ]; then
    wget http://www.seis.sc.edu/downloads/sod/3.2.10/sod-3.2.10.tgz -O /sources/temp/sod.tgz
    # wget https://github.com/crotwell/sod/releases/download/v3.2.10/sod-3.2.10.tgz -O /sources/temp/sod.tgz
fi
mkdir /opt/sod
tar -xzf /sources/temp/sod.tgz -C /opt/sod --strip-components=1
echo 'export PATH=/opt/sod/bin:${PATH}' >> ~/.bashrc
# test
# sod -v