#!/usr/bin/env bash
# Date: 2021-08-03 19:41:01
# Author: WXZhao
# Description: download and install rdseed

# the source code in the Github maybe difficult to buid
if [ ! -f "/sources/temp/rdseed.tar.gz" ]; then
    wget http://ds.iris.edu/pub/programs/rdseedv5.3.1.tar.gz -O /sources/temp/rdseed.tar.gz
fi
mkdir /sources/temp/rdseed
tar -zxf /sources/temp/rdseed.tar.gz -C /sources/temp/rdseed --strip-components=1
mv /sources/temp/rdseed/rdseed.rh6.linux_64 /opt
ln -s /opt/rdseed.rh6.linux_64 /usr/local/bin/rdseed