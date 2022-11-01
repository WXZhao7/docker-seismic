#!/usr/bin/env bash
# Date: 2021-08-04 09:15:46
# Author: WXZhao
# Description: download and install fk

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}fk${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}

# sac env
export SACHOME=/usr/local/sac
export SACAUX=${SACHOME}/aux
export PATH=${SACHOME}/bin:${PATH}

mkdir -p /opt/fk
tar -xf /sources/temp/fk.tar -C /opt/fk --strip-components=1
cd /opt/fk
# fix some bugs
patch < /sources/others/fk3.3-v20190618.patch
make
if [ $? == 0 ]; then
    make clean
    echo -e "${NAME} build ${SUCC}"
    echo 'export PATH=/opt/fk/:${PATH}'>> ~/.bashrc
    rm /sources/temp/fk.tar
else
    echo -e "${NAME} build ${FAIL}"
fi