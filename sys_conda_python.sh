#!/bin/bash

set -e  # Exit immediately if any command fails

# Download Miniconda installer
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh || { echo "Failed to download Miniconda installer."; rm -f Miniconda3-latest-Linux-x86_64.sh; exit 1; }

# Make the installer executable
chmod +x Miniconda3-latest-Linux-x86_64.sh

# Install Miniconda
./Miniconda3-latest-Linux-x86_64.sh -b -p /usr/local/miniconda

# Initialize Conda for Bash shell
/usr/local/miniconda/bin/conda init bash

# Source .bashrc to apply conda init changes
source ~/.bashrc

# Verify the installation
conda --version

# Update conda
conda update -n base -c defaults conda -y

# Cleanup
rm -f Miniconda3-latest-Linux-x86_64.sh

echo "Miniconda installation completed successfully."
