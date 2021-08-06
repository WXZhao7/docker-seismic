#!/usr/bin/env bash
# Date: 2021-08-04 23:49:27
# Author: WXZhao
# Description: download and install gCAP3D

# sac env
export SACHOME=/usr/local/sac
export SACAUX=${SACHOME}/aux
export PATH=${SACHOME}/bin:${PATH}

if [ ! -f "/sources/temp/gCAP3D.tar" ]; then
    wget http://www.eas.slu.edu/People/LZhu/downloads/gCAP3D1.2.tar  -O /sources/temp/gCAP3D.tar
fi

mkdir -p /opt/gCAP3D
tar -xf  /sources/temp/gCAP3D.tar -C /opt/gCAP3D --strip-components=1
cd /opt/gCAP3D
patch <  /sources/others/gCAP3D-install.patch
make
echo 'export PATH=/opt/gCAP3D/:${PATH}'>> ~/.bashrc