#!/usr/bin/env bash
# Date: 2021-08-03 19:18:23
# Author: WXZhao
# Description: run the software install script

set -x
export DEBIAN_FRONTEND="noninteractive"
export TZ=Etc/UTC
# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
apt-get -qq update
apt-get -qq install -y dialog apt-utils
apt-get -qq install -y tzdata
apt-get -qq install -y wget
apt-get -qq install -y curl
apt-get -qq install -y cmake
apt-get -qq install -y gcc g++
apt-get -qq install -y gfortran
apt-get -qq install -y vim
apt-get -qq install -y patch

bash /sources/scripts/install_SAC.sh
bash /sources/scripts/install_gCAP3D.sh
bash /sources/scripts/install_CPS.sh

bash /sources/scripts/install_fk.sh
bash /sources/scripts/install_taup.sh
bash /sources/scripts/install_GMT4.sh
bash /sources/scripts/install_pssac.sh
bash /sources/scripts/install_pssac2.sh
bash /sources/scripts/install_GMT6.sh

bash /sources/scripts/install_SOD.sh
bash /sources/scripts/install_rdseed.sh
bash /sources/scripts/install_phtimes.sh
bash /sources/scripts/others.sh

# clean software cache
apt-get -qq autoremove
apt-get -qq autoclean
rm -rf /var/lib/apt/lists/*