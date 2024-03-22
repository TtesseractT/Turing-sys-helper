#!/bin/bash

# Function to display error message and exit
display_error() {
    echo "Error: $1"
    exit 1
}

# Check if the required arguments are provided
if [ $# -ne 4 ]; then
    display_error "Invalid number of arguments. Usage: script.sh --new_env EnvName --py_version 3.10"
fi

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --new_env)
            new_env_name="$2"
            shift
            shift
            ;;
        --py_version)
            python_version="$2"
            shift
            shift
            ;;
        *)
            display_error "Invalid argument: $key"
            ;;
    esac
done

# Check if the required arguments are provided
if [ -z "$new_env_name" ] || [ -z "$python_version" ]; then
    display_error "Missing required arguments. Usage: script.sh --new_env EnvName --py_version 3.10"
fi

# Create conda environment
conda create -n "$new_env_name" python="$python_version" || display_error "Failed to create conda environment"

# Activate conda environment
read -p "Do you want to activate the conda environment? (y/n): " choice
if [[ $choice == "y" ]]; then
    conda activate "$new_env_name" || display_error "Failed to activate conda environment"
fi
