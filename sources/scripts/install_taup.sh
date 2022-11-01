#!/usr/bin/env bash
# Date: 2021-08-03 19:27:06
# Author: WXZhao
# Description: download and install TauP in Ubuntu

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}TauP${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}


apt-get -qq install -y default-jdk

mkdir /opt/TauP
tar -zxf /sources/temp/TauP.tgz -C /opt/TauP --strip-components=1

if /opt/TauP/bin/taup --version ; then
    echo -e "${NAME} build ${SUCC}"
    echo 'export PATH=/opt/TauP/bin:${PATH}' >> ~/.bashrc
    rm /sources/temp/TauP.tgz
else
    echo -e "${NAME} build ${FAIL}"
fi

