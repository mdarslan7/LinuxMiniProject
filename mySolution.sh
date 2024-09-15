#!/bin/bash
wget https://exit-zero-academy.github.io/DevOpsTheHardWayAssets/linux_project/secretGenerator.tar.gz
gunzip secretGenerator.tar.gz
tar -xvf secretGenerator.tar
cd src
rm -rf maliciousFiles
mkdir secretDir
cd secretDir
touch .secret
chmod 600 .secret
cd ..
chmod +x generateSecret.sh
./generateSecret.sh
