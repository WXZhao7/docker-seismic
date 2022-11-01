#!/usr/bin/env bash
# Date: 2022-10-31 14:44:35
# Author: WXZhao
# Description: install iasp91-phtimes

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}IASP91${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}

if [ -f "/sources/temp/IASP91.tar.gz" ]; then
    apt-get -qq install -y libgfortran4
    mkdir -p /opt/IASP91/iasp91
    tar -xf /sources/temp/IASP91.tar.gz -C /opt/IASP91/iasp91 --strip-components=1
    mv /opt/IASP91/iasp91/iasp91.hed /opt/IASP91/
    mv /opt/IASP91/iasp91/iasp91.tbl /opt/IASP91/

    export IASPMODEL=/opt/IASP91/iasp91
    export PATH=${IASPMODEL}:${PATH}
    if phtimes ; then
        echo -e "${NAME} install ${SUCC}"
        cat << EOF >> ~/.bashrc
# phtimes
export IASPMODEL=/opt/IASP91/iasp91
export PATH=\${IASPMODEL}:\${PATH}
EOF
        rm /sources/temp/IASP91.tar.gz
    else
        echo -e "${NAME} install ${FAIL}"
    fi

fi