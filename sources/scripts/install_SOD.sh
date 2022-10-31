#!/usr/bin/env bash
# Date: 2021-08-04 21:33:39
# Author: WXZhao
# Description: download and install SOD

mkdir /opt/sod
tar -xzf /sources/temp/sod.tgz -C /opt/sod --strip-components=1
echo 'export PATH=/opt/sod/bin:${PATH}' >> ~/.bashrc
# test
# sod -v