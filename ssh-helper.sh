#!/bin/bash

# Function to display error message and exit
display_error() {
    echo "Error: $1"
    exit 1
}

# Check if the required arguments are provided
if [ $# -ne 4 ]; then
    display_error "Invalid number of arguments. Usage: script.sh -e example@example.com"
fi

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -e)
            email="$1"
            shift
            shift
            ;;
        *)
            display_error "Invalid argument: $key"
            ;;
    esac
done

# Check if the required arguments are provided
if [ -z "$email" ]; then
    display_error "Missing required arguments. Usage: script.sh -e example@example.com"
fi


ssh-keygen ed25519 -C "$email" || display_error "Failed to create key"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519 | xclip -sel clip

echo "Use this string with github login SSH"