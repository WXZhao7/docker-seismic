#!/usr/bin/env bash
# Date: 2021-08-04 23:49:27
# Author: WXZhao
# Description: download and install gCAP3D

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}gCAP3D${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}
# sac env
export SACHOME=/usr/local/sac
export SACAUX=${SACHOME}/aux
export PATH=${SACHOME}/bin:${PATH}

apt-get -qq install -y gfortran

mkdir -p /opt/gCAP3D
tar -xf  /sources/temp/gCAP3D.tar -C /opt/gCAP3D --strip-components=1
cd /opt/gCAP3D
patch <  /sources/others/gCAP3D-install.patch
make

if [ $? == 0 ] ; then
    echo -e "${NAME} build ${SUCC}"
    echo 'export PATH=/opt/gCAP3D:${PATH}' >> ~/.bashrc
    rm /sources/temp/gCAP3D.tar
else
    echo -e "${NAME} build ${FAIL}"
fi