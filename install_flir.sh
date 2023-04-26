#!/bin/bash
# https://www.flirkorea.com/support-center/iis/machine-vision/downloads/spinnaker-sdk-download/spinnaker-sdk--download-files/

sudo apt-get install -y \
    libswscale-dev \
    libavcodec-dev \
    libavformat-dev
     
     
cd /tmp
wget https://flir.netx.net/file/asset/52327/original/attachment -O spinnaker-3.0.0.118-amd64-pkg.tar.gz
tar -zxvf spinnaker-3.0.0.118-amd64-pkg.tar.gz
cd spinnaker-3.0.0.118-amd64
./install_spinnaker.sh
