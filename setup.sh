#!/bin/bash

# Make sure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

# Update the system
echo "Updating the system..."
zypper update -y

# Install necessary drivers and codecs
echo "Installing drivers and codecs..."
zypper install -y codecs
zypper install -y alsa-utils
zypper install -y pulseaudio

# Install timeshift
echo "Installing timeshift..."
zypper addrepo --refresh https://download.opensuse.org/repositories/home:/stevenpusser/openSUSE_Tumbleweed/home:stevenpusser.repo
zypper install -y timeshift

# Install Google Chrome
echo "Installing Google Chrome..."
zypper addrepo --refresh http://dl.google.com/linux/chrome/rpm/stable/x86_64 google-chrome
zypper install -y google-chrome-stable

# Install VSCode
echo "Installing Visual Studio Code..."
zypper addrepo --refresh https://packages.microsoft.com/yumrepos/vscode vscode
zypper install -y code

# Install npm, node
echo "Installing npm and node..."
zypper install -y nodejs

# Install python3
echo "Installing Python 3..."
zypper install -y python3

# Install Java
echo "Installing Java..."
zypper install -y java

# Install Discord
echo "Installing Discord..."
zypper addrepo --refresh https://dl.discordapp.net/rpm/stable/ discord
zypper install -y discord

# Install IntelliJ
echo "Installing IntelliJ IDEA..."
wget https://download.jetbrains.com/idea/ideaIU-2021.2.3.tar.gz -O /tmp/intellij.tar.gz
tar -xzvf /tmp/intellij.tar.gz -C /opt
rm /tmp/intellij.tar.gz
ln -s /opt/idea-IU-*/bin/idea.sh /usr/local/bin/intellij

# Install PyCharm
echo "Installing PyCharm..."
wget https://download.jetbrains.com/python/pycharm-professional-2021.2.3.tar.gz -O /tmp/pycharm.tar.gz
tar -xzvf /tmp/pycharm.tar.gz -C /opt
rm /tmp/pycharm.tar.gz
ln -s /opt/pycharm-*/bin/pycharm.sh /usr/local/bin/pycharm

# Install Wireshark
echo "Installing Wireshark..."
zypper install -y wireshark

echo "All software installed. Please reboot your system."
