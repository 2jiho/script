#!/bin/bash
cd /tmp
wget https://flir.netx.net/file/asset/52327/original/attachment -O spinnaker-amd64-pkg.tar.gz
tar -zxvf spinnaker-amd64-pkg.tar.gz 
cd spinnaker-*-amd64
./install_spinnaker.sh
