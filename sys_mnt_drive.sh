#!/bin/bash

# Find the 16T partition
PARTITION=$(sudo lsblk -o NAME,SIZE,TYPE | grep -E '16T|16\.?[0-9]*T' | grep part | awk '{print $1}' | head -n 1)

# Check if the partition was found
if [ -z "$PARTITION" ]; then
  echo "16T partition not found."
  exit 1
fi

# Extract only the partition name without leading symbols
PARTITION_NAME=$(echo $PARTITION | sed 's/[^a-zA-Z0-9]//g')

echo "Partition to mount: /dev/$PARTITION_NAME"

# Create and mount the partition
sudo mkdir -p /mnt/my16tdrive
sudo mount -t ext4 /dev/$PARTITION_NAME /mnt/my16tdrive

# Check if mount was successful
if [ $? -eq 0 ]; then
  echo "Successfully mounted /dev/$PARTITION_NAME to /mnt/my16tdrive."
else
  echo "Failed to mount /dev/$PARTITION_NAME to /mnt/my16tdrive."
  exit 1
fi
