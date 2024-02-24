#!/bin/bash

#####################################The is Backup_script.sh

echo -e "******** Hello! $USERNAME ********"
echo " ================================ "
# to take in put from user
echo -e " \n Get backup of New directory \n "
read -p "Enter the Source_directory_name: " SDN
read -p "Enter the Destination_directory_name: " DDN


# To create source_dir & backup_dir first
mkdir /home/$USERNAME/Backup_Directory/$SDN
mkdir /home/$USERNAME/Backup_Directory/$DDN

# Source directory to be backed up
source_dir="/home/$USERNAME/Backup_Directory/$SDN"

# Backup destination directory
backup_dir="/home/$USERNAME/Backup_Directory/$DDN"

# Timestamp for backup filename
time_stamp=$(date +"%Y%m%d-%H%M%S")
echo " "

# Create a backup archive
backup_filename="$time_stamp.tar.gz"
backup_filepath="${backup_dir}/${backup_filename}"

echo -e "Creating backup of $SDN... \n  "

tar -czvf "$backup_filepath" "$source_dir"
echo " "
if [ $? -eq 0 ]; then
  echo "Backup successful! Archive saved to: $backup_filepath"
else
  echo "Backup failed. Check for errors."
fi
