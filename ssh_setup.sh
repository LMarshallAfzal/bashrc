#!/bin/bash

echo "Generating a new SSH key..."
if ! ssh-keygen -t rsa -b 4096 -C "loma256@gmail.com"; then
  echo "Error: failed to generate a new SSH key"
  exit 1
fi

echo "Adding the SSH key to the ssh-agent..."
if ! eval "$(ssh-agent -s)"; then
  echo "Error: failed to start ssh-agent"
  exit 1
fi

if ! ssh-add ~/.ssh/id_rsa; then
  echo "Error: failed to add the SSH key to the ssh-agent"
  exit 1
fi

echo "Copying the SSH key to your clipboard..."
if ! sudo apt-get install xclip -y; then
  echo "Error: failed to install xclip"
  exit 1
fi

if ! xclip -sel clip < ~/.ssh/id_rsa.pub; then
  echo "Error: failed to copy the SSH key to your clipboard"
  exit 1
fi

echo "Adding the SSH key to your GitHub account..."
echo "Please follow the steps at: https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account"
