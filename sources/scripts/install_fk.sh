#!/usr/bin/env bash
# Date: 2021-08-04 09:15:46
# Author: WXZhao
# Description: download and install fk

# sac env
export SACHOME=/usr/local/sac
export SACAUX=${SACHOME}/aux
export PATH=${SACHOME}/bin:${PATH}

apt-get -qq install -y patch

mkdir -p /opt/fk
tar -xf /sources/temp/fk.tar -C /opt/fk --strip-components=1
cd /opt/fk
# fix some bugs
patch < /sources/others/fk3.3-v20190618.patch
make
make clean
echo 'export PATH=/opt/fk/:${PATH}'>> ~/.bashrc

# test
# fk.pl