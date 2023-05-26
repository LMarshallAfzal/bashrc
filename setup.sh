#!/bin/bash

# Make sure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script as superuser(sudo)."
  exit 1
fi

if [ "$(lsb_release -i -s)" = "openSUSE" ]; then
  echo "Updating the system"
  sudo zypper update

  echo "Installing software"
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub > linux_signing_key.pub
  sudo rpm --import linux_signing_key.pub
  sudo zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
  sudo zypper refresh
  sudo zypper install google-chrome-stable python3 git node wireshark

else
  echo "Updating the system"
  sudo apt update

  echo "Installing software"
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb

  sudo apt install git python3-pip nodejs openjdk-11-jdk wireshark snapd
  sudo snap install discord code
fi

echo "All software installed. Please reboot your system."
