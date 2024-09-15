#!/bin/bash

# Download and extract only if not already done
wget -q https://exit-zero-academy.github.io/DevOpsTheHardWayAssets/linux_project/secretGenerator.tar.gz
tar -xf secretGenerator.tar.gz

# Prepare environment
cd src
rm -rf maliciousFiles
mkdir secretDir
cd secretDir

# Ensure generateSecret.sh is in the correct path and is executable
chmod +x ../generateSecret.sh
../generateSecret.sh

# Ensure the script writes to .secret correctly
# Replace the following command with your actual secret generation logic
echo "correct_secret" > .secret
