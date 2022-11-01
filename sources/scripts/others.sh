#!/usr/bin/env bash
# Date: 2021-08-04 21:43:06
# Author: WXZhao
# Description: make some tools

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'


# distaz
NAME=${BLUE}distaz${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}
cc /sources/others/distaz.c -o /usr/local/bin/distaz -lm
if [ $? -eq 0 ]; then
    echo -e "${NAME} build ${SUCC}"
else
    echo -e "${NAME} build ${FAIL}"
fi