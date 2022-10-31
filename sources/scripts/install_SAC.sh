#!/usr/bin/env bash
# Date: 2021-08-04 10:17:39
# Author: WXZhao
# Description: install SAC if source file existed

if [ -f "/sources/temp/sac-linux_x86_64.tar.gz" ]; then
    #
    apt-get install -y libc6 libsm6 libice6 libxpm4 libx11-6
    apt-get install -y zlib1g libncurses5
    #
    mkdir -p /usr/local/sac
    tar -xzf /sources/temp/sac-linux_x86_64.tar.gz -C /usr/local/sac --strip-components=1
    #
    cat << EOF >> ~/.bashrc
# SAC
export SACHOME=/usr/local/sac
export SACAUX=\${SACHOME}/aux
export PATH=\${SACHOME}/bin:\${PATH}

export SAC_DISPLAY_COPYRIGHT=1
export SAC_PPK_LARGE_CROSSHAIRS=1
export SAC_USE_DATABASE=0
EOF
fi