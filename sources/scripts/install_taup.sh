#!/usr/bin/env bash
# Date: 2021-08-03 19:27:06
# Author: WXZhao
# Description: download and install TauP in Ubuntu

apt-get -qq install -y default-jdk > /dev/null
if [ ! -f "/sources/temp/TauP.tgz" ]; then
    wget http://www.seis.sc.edu/downloads/TauP/TauP-2.5.0.tgz -O /sources/temp/TauP.tgz
    # wget https://github.com/crotwell/TauP/releases/download/v2.5.0/TauP-2.5.0.tgz -O /sources/temp/TauP.tgz
fi
mkdir /opt/TauP
tar -zxf /sources/temp/TauP.tgz -C /opt/TauP --strip-components=1
echo 'export PATH=/opt/TauP/bin:${PATH}' >> ~/.bashrc