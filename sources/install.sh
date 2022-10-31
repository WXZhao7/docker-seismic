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
apt-get update
apt-get install -y dialog apt-utils
apt-get install -y tzdata
apt-get install -y wget
# apt-get install -y curl
apt-get install -y cmake
apt-get install -y gcc g++
apt-get install -y gfortran
apt-get install -y vim

# install
mkdir -p /sources/temp /sources/logs
bash /sources/scripts/install_SAC.sh > /sources/logs/SAC.log 2>&1
bash /sources/scripts/install_fk.sh > /sources/logs/fk.log 2>&1
bash /sources/scripts/install_taup.sh > /sources/logs/TauP.log 2>&1
bash /sources/scripts/install_rdseed.sh > /sources/logs/rdseed.log 2>&1
bash /sources/scripts/install_GMT4.sh > /sources/logs/GMT4.log 2>&1
bash /sources/scripts/install_GMT6.sh > /sources/logs/GMT6.log 2>&1
bash /sources/scripts/install_gCAP3D.sh > /sources/logs/gCAP3D.log 2>&1
# TODO: debug CPS
bash /sources/scripts/install_CPS.sh > /sources/logs/CPS.log 2>&1
bash /sources/scripts/install_SOD.sh > /sources/logs/SOD.log 2>&1
bash /sources/scripts/install_pssac.sh > /sources/logs/pssac.log 2>&1
bash /sources/scripts/install_pssac2.sh > /sources/logs/pssac2.log 2>&1
bash /sources/scripts/install_phtimes.sh sources/logs/phtimes.log 2>&1
bash /sources/scripts/others.sh > /sources/logs/others.log 2>&1

# clean software list
apt-get autoremove
apt-get autoclean
rm -rf /var/lib/apt/lists/*