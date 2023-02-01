#!/bin/bash

# Ask user for folder name
echo "Enter a folder name: "
read folder_name

# Check if folder exists
if [ -d "$folder_name" ]; then
  # Delete contents of folder
  rm -r "$folder_name"
else
  # Create folder
  mkdir "$folder_name"
  
fi

# Check for invalid characters in folder name
if [[ $folder_name = *\ * ]] || [[ $folder_name = *-* ]]; then
  echo "Error: Folder name cannot contain spaces or dashes."
  exit 1

fi

# Ask user for file name
echo "Enter a file name: "
read file_name

# Check for invalid characters in file name
if [[ $file_name = *\ * ]] || [[ $file_name = *-* ]]; then
  echo "Error: File name cannot contain spaces or dashes."
  exit 1
fi

# Create file inside folder
touch "$folder_name/$file_name"

# Set read and write permissions for current user
chmod 600 "$folder_name/$file_name"

# Write detailed output of contents of folder to file
ls -la "$folder_name" > "$folder_name/$file_name"

echo "Task completed successfully."
