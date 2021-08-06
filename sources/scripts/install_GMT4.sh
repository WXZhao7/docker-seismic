#!/usr/bin/env bash
# Date: 2021-08-04 17:00:16
# Author: WXZhao
# Description: download and install GMT4

# dowmload files
if [ ! -f "/sources/temp/gshhg-gmt.tar.gz" ]; then
    wget http://mirrors.ustc.edu.cn/gmt/gshhg-gmt-2.3.7.tar.gz -O /sources/temp/gshhg-gmt.tar.gz
    # wget https://github.com/GenericMappingTools/gshhg-gmt/releases/download/2.3.7/gshhg-gmt-2.3.7.tar.gz -O /sources/temp/gshhg-gmt.tar.gz
fi

if [ ! -f "/sources/temp/gmt4.tar.bz2" ]; then
    wget http://mirrors.ustc.edu.cn/gmt/gmt-4.5.18-src.tar.bz2 -O /sources/temp/gmt4.tar.bz2
    # wget ftp://ftp.soest.hawaii.edu/gmt/gmt-4.5.18-src.tar.bz2 -O /sources/temp/gmt4.tar.bz2
fi

apt-get -qq install -y gcc g++ make libc6 > /dev/null
apt-get -qq install -y ghostscript > /dev/null
# REVIEW here I ignore python-gdal, because it missed in Ubuntu20.0.4. I use gdal-bin to replace it
apt-get -qq install -y libnetcdf-dev libgdal-dev gdal-bin > /dev/null
apt-get -qq install -y libxaw7-dev > /dev/null
apt-get -qq install -y libice-dev libsm-dev libx11-dev > /dev/null
apt-get -qq install -y libxext-dev libxmu-dev libxt-dev > /dev/null

mkdir -p /sources/temp/GMT4
tar -xf /sources/temp/gmt4.tar.bz2 -C /sources/temp/GMT4 --strip-components=1
cd /sources/temp/GMT4
./configure --prefix=/opt/GMT4
make
make install-all

mkdir -p /opt/GMT4/share/coast
tar -xzf /sources/temp/gshhg-gmt.tar.gz -C /opt/GMT4/share/coast --strip-components=1

cat << EOF >> ~/.bashrc
# GMT4
export GMT4HOME=/opt/GMT4
export PATH=\${GMT4HOME}/bin:\${PATH}
export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:\${GMT4HOME}/lib64
EOF

# test
# pscoast -JM7 -R117/126/18/26 -G50/50/50 -S150/150/150 -W1 -Di -V -K >> /sources/temp/test.ps