#!/usr/bin/env bash
# Date: 2021-08-05 15:42:33
# Author: WXZhao
# Description: download and install pssac for GMT4

if [ ! -f "/sources/temp/pssac.tar" ]; then
    wget http://www.eas.slu.edu/People/LZhu/downloads/pssac.tar -O /sources/temp/pssac.tar
fi
if [ ! -f "/sources/temp/pssac.c" ]; then
    wget http://www.eas.slu.edu/People/LZhu/downloads/pssac.c -O /sources/temp/pssac.c
fi
mkdir -p /opt/pssac
tar -xf /sources/temp/pssac.tar -C /opt/pssac --strip-components=1
cp /sources/temp/pssac.c /opt/pssac/
cd /opt/pssac/

patch < /sources/others/pssac-Makefile.patch

make

cp pssac /opt/GMT4/bin