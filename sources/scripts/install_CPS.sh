#!/usr/bin/env bash
# Date: 2021-08-03 20:08:56
# Author: WXZhao
# Description: install CPS if source file existed
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}CPS${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}

if [ -f "/sources/temp/CPS.tgz" ]; then
    apt-get -qq install -y libx11-dev

    mkdir -p /opt/CPS
    tar -xzf /sources/temp/CPS.tgz -C /opt/CPS --strip-components=1
    cd /opt/CPS
    ./Setup LINUX6440
    ./C > C.txt 2>&1
    export PATH=/opt/CPS/bin:${PATH}
    if sdisp96 -h >/dev/null 2>&1 ; then
        echo -e "${NAME} build ${SUCC}"
        echo 'export PATH=/opt/CPS/bin:${PATH}' >> ~/.bashrc
        rm /sources/temp/CPS.tgz
    else
        echo -e "${NAME} build ${FAIL}"
    fi
fi