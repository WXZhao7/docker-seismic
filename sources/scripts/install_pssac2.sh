#!/usr/bin/env bash
# Date: 2021-08-05 15:42:34
# Author: WXZhao
# Description: download and install pssac2 for GMT4

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}pssac2${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}

mkdir -p /opt/pssac2
tar -xzf /sources/temp/pssac2.tar.gz -C /opt/pssac2 --strip-components=1
cd /opt/pssac2
./configure --with-gmt=/opt/GMT4
make

if [ -f "/opt/pssac2/pssac2" ]; then
    echo -e "${NAME} build ${SUCC}"
    cp /opt/pssac2/pssac2 /opt/GMT4/bin
    rm /sources/temp/pssac2.tar.gz
else
    echo -e "${NAME} build ${FAIL}"
fi
