#!/bin/bash

set -e  # Exit immediately if any command fails

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install ubuntu-drivers-common package
sudo apt install ubuntu-drivers-common -y

# Auto-install the recommended drivers
sudo ubuntu-drivers autoinstall

# Print success message
echo "System drivers installation completed successfully."
echo "Rebooting System to take effect."

# Reboot the system
sudo reboot
