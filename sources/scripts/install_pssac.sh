#!/usr/bin/env bash
# Date: 2021-08-05 15:42:33
# Author: WXZhao
# Description: download and install pssac for GMT4

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}pssac${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}

mkdir -p /opt/pssac
tar -xf /sources/temp/pssac.tar -C /opt/pssac --strip-components=1
cp /sources/temp/pssac.c /opt/pssac/
cd /opt/pssac/

patch < /sources/others/pssac-Makefile.patch
make
if [ -f "/opt/pssac/pssac" ]; then
    echo -e "${NAME} build ${SUCC}"
    cp /opt/pssac/pssac /opt/GMT4/bin
    rm /sources/temp/pssac.tar /sources/temp/pssac.c
else
    echo -e "${NAME} build ${FAIL}"
fi
