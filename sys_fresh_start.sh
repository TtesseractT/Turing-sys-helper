#!/bin/bash

# Function to handle errors
handle_error() {
    echo "An error occurred. Exiting..."
    exit 1
}

# Ensure the script is running with superuser privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Run the sys_drivers.sh script
echo "Running sys_drivers.sh..."
./sys_drivers.sh || handle_error

# Run the sys_conda_python.sh script
echo "Running sys_conda_python.sh..."
./sys_conda_python.sh || handle_error

# Prompt the user for the new environment name and Python version
echo "You need to provide the new environment name and Python version for the Conda environment."
read -p "Enter the new Conda environment name: " new_env_name
read -p "Enter the Python version for the new environment (e.g., 3.8, 3.9, 3.10): " python_version

# Run the sys_conda_environment.sh script with user-provided arguments
echo "Running sys_conda_environment.sh with --new_env $new_env_name and --py_version $python_version..."
./sys_conda_environment.sh --new_env "$new_env_name" --py_version "$python_version" || handle_error

echo "All scripts executed successfully."
echo "Rebooting System to take effect."

# Reboot the system
reboot
