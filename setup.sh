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
  if ! wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb; then
    echo "Error: failed to download Google Chrome package"
    exit 1
  fi
  if ! sudo dpkg -i google-chrome-stable_current_amd64.deb; then
    echo "Error: failed to install Google Chrome"
    exit 1
  fi
  rm google-chrome-stable_current_amd64.deb

  echo "Installing Visual Studio Code on Ubuntu..."
  if ! curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg; then
    echo "Error: failed to download Microsoft GPG key"
    exit 1
  fi
  if ! sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/; then
    echo "Error: failed to install Microsoft GPG key"
    exit 1
  fi
  if ! sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'; then
    echo "Error: failed to add Visual Studio Code repository"
    exit 1
  fi
  if ! sudo apt-get update; then
    echo "Error: failed to update apt repository"
    exit 1
  fi
  if ! sudo apt-get install code; then
    echo "Error: failed to install Visual Studio Code"
    exit 1
  fi

  echo "Installing Eclipse on Ubuntu..."
  if ! sudo apt-get update; then
    echo "Error: failed to update apt repository"
    exit 1
  fi
  if ! sudo apt-get install eclipse; then
    echo "Error: failed to install Eclipse"
    exit 1
  fi

  echo "Installing npm on Ubuntu"
  if ! curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -; then
    echo "Error: failed to setup node.js repository"
    exit 1
  fi
  if ! sudo apt-get install -y nodejs; then
    echo "Error: failed to install node.js"
    exit 1
  fi

  echo "Installing Java on Ubuntu"
  if ! sudo apt-get install -y openjdk-14-jdk; then
    echo "Error: failed to install Java"
    exit 1
  fi

  echo "Installing Python on Ubuntu"
  if ! sudo apt-get install -y python3; then
    echo "Error: failed to install Python"
    exit 1
  fi
fi

fi

# Install applications on OpenSUSE
if [ "$OS" == "opensuse" ]; then
  echo "Installing Google Chrome on OpenSUSE..."
  sudo zypper addrepo --refresh https://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome || { echo "Error adding repository for Google Chrome."; exit 1; }
  sudo zypper install google-chrome-stable || { echo "Error installing Google Chrome."; exit 1; }

  echo "Installing Visual Studio Code on OpenSUSE..."
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc || { echo "Error importing key for Visual Studio Code."; exit 1; }
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo' || { echo "Error creating repository for Visual Studio Code."; exit 1; }
  sudo zypper refresh || { echo "Error refreshing repository."; exit 1; }
  sudo zypper install code || { echo "Error installing Visual Studio Code."; exit 1; }

  echo "Installing Eclipse on OpenSUSE..."
  sudo zypper addrepo http://download.eclipse.org/ eclipse || { echo "Error adding repository for Eclipse."; exit 1; }
  sudo zypper refresh || { echo "Error refreshing repository."; exit 1; }
  sudo zypper install eclipse || { echo "Error installing Eclipse."; exit 1; }
  echo "Eclipse installed on OpenSUSE"

  echo "Installing npm on OpenSUSE..."
  sudo zypper refresh || { echo "Error refreshing repository."; exit 1; }
  sudo zypper install nodejs || { echo "Error installing Node.js."; exit 1; }
  sudo zypper install npm || { echo "Error installing npm."; exit 1; }

  echo "Installing Java on OpenSUSE..."
  sudo zypper refresh || { echo "Error refreshing repository."; exit 1; }
  sudo zypper install java-1_8_0-openjdk-devel || { echo "Error installing Java."; exit 1; }

  echo "Installing Python on OpenSUSE..."
  sudo zypper refresh || { echo "Error refreshing repository."; exit 1; }
  sudo zypper install python3 || { echo "Error installing Python."; exit 1; }

  echo "Installing Asus-Linux on OpenSUSE..."
  sudo zypper ar --priority 50 --refresh https://download.opensuse.org/repositories/home:/luke_nukem:/asus/openSUSE_Tumbleweed/ asus-linux || { echo "Error adding repository for Asus-Linux."; exit 1; }
  sudo zypper refresh || { echo "Error refreshing repository."; exit 1; }
  sudo zypper install asusctl || { echo "Error installing Asus-Linux"; exit 1; }
fi


# Install applications on Manjaro
if [ "$OS" == "manjaro" ]; then
  sudo pacman -Syu

  echo "Installing Google Chrome on Manjaro..."
  if ! sudo pacman -S google-chrome; then
    echo "Failed to install Google Chrome. Please try again later."
    exit 1
  fi

  echo "Installing Visual Studio Code on Manjaro..."
  if ! sudo pacman -S code; then
    echo "Failed to install Visual Studio Code. Please try again later."
    exit 1
  fi

  echo "Installing Eclipse on Manjaro..."
  if ! sudo pacman -S eclipse; then
    echo "Failed to install Eclipse. Please try again later."
    exit 1
  fi

  echo "Installing npm on Manjaro..."
  if ! sudo pacman -S npm; then
    echo "Failed to install npm. Please try again later."
    exit 1
  fi

  if ! sudo pacman -S nodejs; then
    echo "Failed to install nodejs. Please try again later."
    exit 1
  fi

  echo "Installing python on Manjaro..."
  if ! sudo pacman -S python; then
    echo "Failed to install python. Please try again later."
    exit 1
  fi

  echo "Installing Java on Manjaro..."
  if ! sudo pacman -S jdk-openjdk; then
    echo "Failed to install Java. Please try again later."
    exit 1
  fi
fi


echo "All application have been installed! You must reboot your system for the changes to take effect."