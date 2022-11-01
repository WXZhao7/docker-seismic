#!/usr/bin/env bash
# Date: 2021-08-03 19:41:01
# Author: WXZhao
# Description: download and install rdseed

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}rdseed${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}
# manully build it
cp /sources/temp/rdseed /opt
ln -s /opt/rdseed /usr/local/bin/rdseed

if [ -f "/usr/local/sac/bin/sac" ]; then
    echo -e "${NAME} install ${SUCC}"
    rm /sources/temp/rdseed
else
    echo -e "${NAME} install ${FAIL}"
fi