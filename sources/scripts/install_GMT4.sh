#!/usr/bin/env bash
# Date: 2021-08-04 17:00:16
# Author: WXZhao
# Description: download and install GMT4

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}GMT4${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}

apt-get -qq install -y gcc g++ make libc6
apt-get -qq install -y ghostscript
# REVIEW here I ignore python-gdal, because it missed in Ubuntu20.0.4. I use gdal-bin to replace it
apt-get -qq install -y libnetcdf-dev libgdal-dev gdal-bin
apt-get -qq install -y libxaw7-dev
apt-get -qq install -y libice-dev libsm-dev libx11-dev
apt-get -qq install -y libxext-dev libxmu-dev libxt-dev

mkdir -p /sources/temp/GMT4
tar -xf /sources/temp/gmt4.tar.bz2 -C /sources/temp/GMT4 --strip-components=1
cd /sources/temp/GMT4
./configure --prefix=/opt/GMT4
make
make install-all

mkdir -p /opt/GMT4/share/coast
tar -xzf /sources/temp/gshhg-gmt.tar.gz -C /opt/GMT4/share/coast --strip-components=1

# test
export GMT4HOME=/opt/GMT4
export PATH=${GMT4HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${GMT4HOME}/lib64
pscoast -JM7 -R117/126/18/26 -G50/50/50 -S150/150/150 -W1 -Di -K > /sources/temp/test.ps
FILESIZE=$(stat --printf="%s" /sources/temp/test.ps)
MINSIZE=52000

if (( FILESIZE > MINSIZE)); then
    echo -e "${NAME} build ${SUCC}"
    cat << EOF >> ~/.bashrc
# GMT4
export GMT4HOME=/opt/GMT4
export PATH=\${GMT4HOME}/bin:\${PATH}
export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:\${GMT4HOME}/lib64
EOF
    rm -rf  /sources/temp/gmt4.tar.bz2 /sources/temp/gshhg-gmt.tar.gz /sources/temp/test.ps /sources/temp/GMT4
else
    echo -e "${NAME} build ${FAIL}"
fi
