#!/usr/bin/env bash
# Date: 2021-08-03 19:27:06
# Author: WXZhao
# Description: download and install TauP in Ubuntu

apt-get install -y default-jdk

mkdir /opt/TauP
tar -zxf /sources/temp/TauP.tgz -C /opt/TauP --strip-components=1
echo 'export PATH=/opt/TauP/bin:${PATH}' >> ~/.bashrc