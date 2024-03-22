#!/bin/bash

set -e  # Exit immediately if any command fails

# Download Miniconda installer
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh || { echo "Failed to download Miniconda installer."; rm -f Miniconda3-latest-Linux-x86_64.sh; exit 1; }

# Make the installer executable
chmod +x Miniconda3-latest-Linux-x86_64.sh

# Check if the Miniconda installation directory already exists
if [ ! -d "/usr/local/miniconda" ]; then
    # Install Miniconda if the directory does not exist
    ./Miniconda3-latest-Linux-x86_64.sh -b -p /usr/local/miniconda
fi

# Add Miniconda to the PATH for the current script
export PATH="/usr/local/miniconda/bin:$PATH"

# Also add Miniconda to the PATH persistently for future terminal sessions
echo 'export PATH="/usr/local/miniconda/bin:$PATH"' >> ~/.bashrc

# Verify the installation by checking the conda version
conda --version

# Update conda
conda update -n base -c defaults conda -y

# Cleanup the installer
rm -f Miniconda3-latest-Linux-x86_64.sh

echo "Miniconda installation completed successfully."
