#!/bin/bash
cd /tmp
wget https://flir.netx.net/file/asset/52327/original/attachment -O spinnaker-3.0.0.118-amd64-pkg.tar.gz
tar -zxvf spinnaker-3.0.0.118-amd64-pkg.tar.gz
cd spinnaker-3.0.0.118-amd64
./install_spinnaker.sh
