#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -x  # Print commands and their arguments as they are executed

# Download and extract only if not already done
if [ ! -f secretGenerator.tar.gz ]; then
    wget -q https://exit-zero-academy.github.io/DevOpsTheHardWayAssets/linux_project/secretGenerator.tar.gz
    tar -xf secretGenerator.tar.gz
fi

# Prepare environment
cd src || exit 1
pwd  # Print current working directory
ls -la  # List all files in the current directory

rm -rf maliciousFiles
mkdir -p secretDir
chmod 755 secretDir

# Ensure generateSecret.sh is in the correct path and is executable
chmod +x generateSecret.sh
ls -la  # List files again to confirm permissions

# Run generateSecret.sh
./generateSecret.sh

# Check if .secret file was created
if [ ! -f secretDir/.secret ]; then
    echo "Failed to generate .secret file"
    exit 1
fi

# Output the content of .secret for debugging
echo "Content of .secret:"
cat secretDir/.secret

# Return to the original directory
cd ..

# Create the SOLUTION file with the correct secret
echo "$(cat src/secretDir/.secret)" > SOLUTION

echo "Script completed successfully"
