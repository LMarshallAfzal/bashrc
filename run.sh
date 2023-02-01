#!/bin/bash

# Define an array of the file names
declare -a files=(.bashrc .bash_aliases .inputrc .gitconfig)

# Loop through the array of file names
for file in "${files[@]}"; do
  # Get the path of the file in the repo
  repo_file_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$file"

  # Get the path of the system's file
  system_file_path="$HOME/$file"

  # Create the system's file if it does not exist
  if [ ! -f "$system_file_path" ]; then
    touch "$system_file_path"
    echo "$file file created in $system_file_path"
  fi

  # Replace the contents of the system's file with the contents of the repo's file
  echo "Replacing the contents of $system_file_path with $repo_file_path..."
  cat "$repo_file_path" > "$system_file_path"

done

# Get the path of the setup.sh file in the repo
setup_script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/setup.sh"

# Check if the setup.sh file exists
if [ ! -f "$setup_script_path" ]; then
  echo "Error: setup.sh file not found in $setup_script_path"
  exit 1
fi

# Run the setup.sh script
echo "Running $setup_script_path..."
. "$setup_script_path"

echo "Done."
