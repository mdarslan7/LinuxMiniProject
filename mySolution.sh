#!/bin/bash

# Download and extract only if not already done
if [ ! -f secretGenerator.tar.gz ]; then
    wget -q https://exit-zero-academy.github.io/DevOpsTheHardWayAssets/linux_project/secretGenerator.tar.gz
    tar -xf secretGenerator.tar.gz
fi

# Prepare environment
cd src
rm -rf maliciousFiles
mkdir -p secretDir
cd secretDir

# Ensure generateSecret.sh is in the correct path and is executable
chmod +x ../generateSecret.sh
../generateSecret.sh

# Check if .secret file was created
if [ ! -f .secret ]; then
    echo "Failed to generate .secret file"
    exit 1
fi

# Output the content of .secret for debugging
echo "Content of .secret:"
cat .secret

# Return to the original directory
cd ../../

# Create the SOLUTION file with the correct secret
echo "$(cat src/secretDir/.secret)" > SOLUTION
