#!/bin/bash

# FILEPATH: /c:/Users/foxyb/Desktop/vs-code=projects/TURING/source-code/main/vm-checker/sys_conda_python.sh

set -e  # Exit immediately if any command fails

# Download Miniconda installer
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# Make the installer executable
chmod +x Miniconda3-latest-Linux-x86_64.sh

# Run the installer in batch mode and install to /usr/local/miniconda
./Miniconda3-latest-Linux-x86_64.sh -b -p /usr/local/miniconda

# Add Miniconda to the PATH
echo 'export PATH="/usr/local/miniconda/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Verify the installation
conda --version

# Update conda
conda update -n base -c defaults conda

# Cleanup
rm Miniconda3-latest-Linux-x86_64.sh

echo "Miniconda installation completed successfully."

