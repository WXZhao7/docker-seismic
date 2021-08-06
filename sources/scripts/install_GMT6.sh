#!/usr/bin/env bash
# Date: 2021-08-04 20:00:39
# Author: WXZhao
# Description: download and install GMT5


# dowmload files
if [ ! -f "/sources/temp/gshhg-gmt.tar.gz" ]; then
    wget http://mirrors.ustc.edu.cn/gmt/gshhg-gmt-2.3.7.tar.gz -O /sources/temp/gshhg-gmt.tar.gz
    # wget https://github.com/GenericMappingTools/gshhg-gmt/releases/download/2.3.7/gshhg-gmt-2.3.7.tar.gz -O /sources/temp/gshhg-gmt.tar.gz
fi
if [ ! -f "/sources/temp/dcw-gmt.tar.gz" ]; then
    wget https://github.com/GenericMappingTools/dcw-gmt/releases/download/2.0.0/dcw-gmt-2.0.0.tar.gz -O /sources/temp/dcw-gmt.tar.gz
fi

if [ ! -f "/sources/temp/gmt6.tar.gz" ]; then
    wget http://mirrors.ustc.edu.cn/gmt/gmt-6.2.0-src.tar.gz -O /sources/temp/gmt6.tar.gz
    # wget https://github.com/GenericMappingTools/gmt/releases/tag/6.2.0 -O /sources/temp/gmt6.tar.gz
fi
# temporary remove anaconda env.
export PATH=$(echo $PATH | awk -v RS=":" '{print $1}' | grep -iv "conda" | awk -v ORS=":" '{print $1}')

apt-get -qq install -y build-essential cmake libcurl4-gnutls-dev libnetcdf-dev > /dev/null
apt-get -qq install -y ghostscript gdal-bin libgdal-dev libglib2.0-dev libpcre3-dev libfftw3-dev liblapack-dev > /dev/null

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

cat << EOF >> ~/.bashrc
# GMT6
export GMT6HOME=/opt/GMT6
export PATH=\${GMT6HOME}/bin:\${PATH}
export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:\${GMT6HOME}/lib64
EOF