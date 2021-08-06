#!/usr/bin/env bash
# Date: 2021-08-05 15:42:34
# Author: WXZhao
# Description: download and install pssac2 for GMT4
if [ -f "/sources/temp/pssac2.tar.gz" ]; then
    mkdir -p /opt/pssac2
    tar -xzf /sources/temp/pssac2.tar.gz -C /opt/pssac2 --strip-components=1
    cd /opt/pssac2
    ./configure --with-gmt=/opt/GMT4
    make
    cp pssac2 /opt/GMT4/bin
fi