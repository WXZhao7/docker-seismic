#!/usr/bin/env bash
# Date: 2021-08-04 10:17:39
# Author: WXZhao
# Description: install SAC if source file existed

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}SAC${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}

if [ -f "/sources/temp/sac-linux_x86_64.tar.gz" ]; then
    #
    apt-get install -y libc6 libsm6 libice6 libxpm4 libx11-6
    apt-get install -y zlib1g libncurses5
    #
    mkdir -p /usr/local/sac
    tar -xzf /sources/temp/sac-linux_x86_64.tar.gz -C /usr/local/sac --strip-components=1
    #
    if [ -f "/usr/local/sac/bin/sac" ]; then
        echo -e "${NAME} install ${SUCC}"
        cat << EOF >> ~/.bashrc
# SAC
export SACHOME=/usr/local/sac
export SACAUX=\${SACHOME}/aux
export PATH=\${SACHOME}/bin:\${PATH}

export SAC_DISPLAY_COPYRIGHT=1
export SAC_PPK_LARGE_CROSSHAIRS=1
export SAC_USE_DATABASE=0
EOF
        rm /sources/temp/sac-linux_x86_64.tar.gz
    else
        echo -e "${NAME} install ${FAIL}"
    fi
fi