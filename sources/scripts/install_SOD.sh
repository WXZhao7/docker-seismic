#!/usr/bin/env bash
# Date: 2021-08-04 21:33:39
# Author: WXZhao
# Description: download and install SOD

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}SOD${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}

mkdir /opt/sod
tar -xzf /sources/temp/sod.tgz -C /opt/sod --strip-components=1

export PATH=/opt/sod/bin:${PATH}
if sod -v ; then
    echo -e "${NAME} install ${SUCC}"
    echo 'export PATH=/opt/sod/bin:${PATH}' >> ~/.bashrc
    rm /sources/temp/sod.tgz
else
    echo -e "${NAME} install ${FAIL}"
fi