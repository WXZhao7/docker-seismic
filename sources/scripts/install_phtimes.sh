#!/usr/bin/env bash
# Date: 2022-10-31 14:44:35
# Author: WXZhao
# Description: install iasp91-phtimes

if [ -f "/sources/temp/IASP91.tar.gz" ]; then
    tar -xf /sources/temp/IASP91.tar.gz -C /opt/IASP91/iasp91 --strip-components=1
    mv /opt/IASP91/iasp91/iasp91.hed ..
    mv /opt/IASP91/iasp91/iasp91.tbl ..
    cat << EOF >> ~/.bashrc
# phtimes
export IASPMODEL=/opt/IASP91/iasp91
export PATH=${IASPMODEL}:$PATH
EOF

fi