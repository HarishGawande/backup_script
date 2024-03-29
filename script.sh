#!/bin/bash

#####################################The is Backup_script.sh

echo -e " \n ******** Hello! $(whoami) ********"
echo " ================================ "
# to take in put from user
echo -e " \n Get backup of New directory \n "
read -p "Enter the Source_directory_name: " SDN
read -p "Enter the Destination_directory_name: " DDN


# To create source_dir & backup_dir first
sudo mkdir $(pwd)/$SDN
sudo mkdir $(pwd)/$DDN

# Source directory to be backed up
source_dir="$(pwd)/$SDN"

# Backup destination directory
backup_dir="$(pwd)/$DDN"

# Timestamp for backup filename
time_stamp=$(date +"%Y%m%d-%H%M%S")
echo " "

# Create a backup archive
backup_filename="$time_stamp.tar.gz"
backup_filepath="${backup_dir}/${backup_filename}"

echo -e "Creating backup of $SDN... \n  "

sudo tar -czvf "$backup_filepath" "$source_dir"
echo " "
if [ $? -eq 0 ]; then
  echo "Backup successful! Archive saved to: $backup_filepath"
else
  echo "Backup failed. Check for errors."
fi
echo " "
