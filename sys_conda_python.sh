#!/bin/bash

set -e  # Exit immediately if any command fails

# Define a cleanup function
cleanup() {
    echo "Cleaning up..."
    rm -f Miniconda3-latest-Linux-x86_64.sh
}

# Register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

# Download Miniconda installer
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# Make the installer executable
chmod +x Miniconda3-latest-Linux-x86_64.sh

# Run the installer in batch mode and install to /usr/local/miniconda
./Miniconda3-latest-Linux-x86_64.sh -u -b -p /usr/local/miniconda

# Add Miniconda to the PATH for the current script
export PATH="/usr/local/miniconda/bin:$PATH"

# Also add Miniconda to the PATH persistently for future terminal sessions
echo 'export PATH="/usr/local/miniconda/bin:$PATH"'

# Source .bashrc to apply conda init changes
source ~/.bashrc

# Verify the installation
conda --version

# Update conda
conda update -n base -c defaults conda -y

echo "Miniconda installation completed successfully."
