#!/bin/bash

set -e 
set -x  

if [ ! -f secretGenerator.tar.gz ]; then
    wget -q https://exit-zero-academy.github.io/DevOpsTheHardWayAssets/linux_project/secretGenerator.tar.gz
    tar -xf secretGenerator.tar.gz
fi

cd src || exit 1
pwd  
ls -la  
rm -rf maliciousFiles
mkdir -p secretDir
chmod 755 secretDir

touch secretDir/.secret
chmod 600 secretDir/.secret 

chmod +x generateSecret.sh
ls -la secretDir  

./generateSecret.sh

if [ ! -s secretDir/.secret ]; then
    echo "Failed to generate content in .secret file"
    exit 1
fi

echo "Content of .secret:"
cat secretDir/.secret

cd ..

echo "$(cat src/secretDir/.secret)" > SOLUTION

echo "Script completed successfully"
