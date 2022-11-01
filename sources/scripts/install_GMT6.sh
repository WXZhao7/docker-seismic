#!/usr/bin/env bash
# Date: 2021-08-04 20:00:39
# Author: WXZhao
# Description: download and install GMT5

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CLEAN='\033[0m'
NAME=${BLUE}GMT6${CLEAN}
SUCC=${GREEN}successfully${CLEAN}
FAIL=${RED}failed${CLEAN}

apt-get -qq install -y build-essential cmake libcurl4-gnutls-dev libnetcdf-dev
apt-get -qq install -y ghostscript gdal-bin libgdal-dev libglib2.0-dev libpcre3-dev libfftw3-dev liblapack-dev

mkdir -p /sources/temp/GMT6
tar -xzf /sources/temp/gmt6.tar.gz -C /sources/temp/GMT6 --strip-components=1
mkdir -p /sources/temp/GMT6/share/gshhg-gmt
tar -xzf /sources/temp/gshhg-gmt.tar.gz -C /sources/temp/GMT6/share/gshhg-gmt --strip-components=1
mkdir -p /sources/temp/GMT6/share/dcw-gmt
tar -xzf /sources/temp/dcw-gmt.tar.gz -C /sources/temp/GMT6/share/dcw-gmt --strip-components=1

cd /sources/temp/GMT6
cat << EOF > cmake/ConfigUser.cmake
set (CMAKE_INSTALL_PREFIX "/opt/GMT6")
set (GMT_USE_THREADS TRUE)
EOF
mkdir build
cd build/
cmake ..
make -j
make -j install


export GMT6HOME=/opt/GMT6
export PATH=${GMT6HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${GMT6HOME}/lib64

if gmt --verison ;then
    echo -e "${NAME} build ${SUCC}"
    cat << EOF >> ~/.bashrc
# GMT6
export GMT6HOME=/opt/GMT6
export PATH=\${GMT6HOME}/bin:\${PATH}
export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:\${GMT6HOME}/lib64
EOF
    rm -rf /sources/temp/gmt6.tar.gz /sources/temp/gshhg-gmt.tar.gz /sources/temp/dcw-gmt.tar.gz /sources/temp/GMT6
else
    echo -e "${NAME} build ${FAIL}"
fi