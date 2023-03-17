#!/bin/bash

# Define a function to handle errors
handle_error() {
  echo "Error: $1" >&2
  exit 1
}

# Check that a directory has been specified
if [ $# -lt 1 ]; then
  handle_error "No directory specified"
fi

# Check that the directory exists
if [ ! -d "$1" ]; then
  handle_error "Directory does not exist: $1"
fi

# Define a function to rename the files in the directory
rename_files() {
  local dir="$1"
  local pattern="$2"
  local replacement="$3"

  # Loop through the files in the directory
  for file in "$dir"/*; do
    # Check that the file is a regular file
    if [ ! -f "$file" ]; then
      continue
    fi

    # Check that the file name matches the pattern
    if [[ "$file" != "${file/$pattern/$replacement}" ]]; then
      continue
    fi

    # Rename the file
    mv "$file" "${file/$pattern/$replacement}"
  done
}

# Call the rename_files function
rename_files "$1" "$2" "$3"
