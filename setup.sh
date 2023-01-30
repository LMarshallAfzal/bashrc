#!/bin/bash

# Check the current operating system
if [ "$(uname)" == "Linux" ]; then
  OS=$(cat /etc/os-release | grep ^ID= | cut -d= -f2 | tr -d '"')
else
  echo "This script is for Linux systems only."
  exit 1
fi

# Install applications on Ubuntu
if [ "$OS" == "ubuntu" ]; then
  echo "Installing Google Chrome on Ubuntu..."
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb

  echo "Installing Visual Studio Code on Ubuntu..."
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
  sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt-get update
  sudo apt-get install code

  echo "Installing Eclipse on Ubuntu..."
  sudo apt-get update
  sudo apt-get install eclipse

  echo "Installing npm on Ubuntu"
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt-get install -y nodejs

  echo "Installing Java on Ubuntu"
  sudo apt-get install -y openjdk-14-jdk

  echo "Installing Python on Ubuntu"
  sudo apt-get install -y python3
fi

# Install applications on OpenSUSE
if [ "$OS" == "opensuse" ]; then
  echo "Installing Google Chrome on OpenSUSE..."
  sudo zypper addrepo --refresh https://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
  sudo zypper install google-chrome-stable

  echo "Installing Visual Studio Code on OpenSUSE..."
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
  sudo zypper refresh
  sudo zypper install code

  echo "Installing Eclipse on OpenSUSE..."
  sudo zypper addrepo http://download.eclipse.org/ eclipse
  sudo zypper refresh
  sudo zypper install eclipse
  echo "Eclipse installed on OpenSUSE"

  echo "Installing npm on OpenSUSE..."
  sudo zypper refresh
  sudo zypper install nodejs
  sudo zypper install npm

  echo "Installing Java on OpenSUSE..."
  sudo zypper refresh
  sudo zypper install java-1_8_0-openjdk-devel

  echo "Installing Python on OpenSUSE..."
  sudo zypper refresh
  sudo zypper install python3
fi

# Install applications Manjaro
if [ "$OS" == "manjaro" ]; then
  sudo pacman -Syu

  echo "Installing Google Chrome on Manjaro..."
  sudo pacman -S google-chrome

  echo "Installing Visual Studio Code on Manjaro..."
  sudo pacman -S code

  echo "Installing Eclipse on Manjaro..."
  sudo pacman -S eclipse

  echo "Installing npm on Manjaro..."
  sudo pacman -S npm
  sudo pacman -S nodejs

  echo "Installing python on Manjaro..."
  sudo pacman -S python

  echo "Installing Java on Manjaro"
  sudo pacman -S jdk-openjdk
fi

echo "All application have been installed!"



