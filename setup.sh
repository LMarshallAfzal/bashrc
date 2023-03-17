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
zypper install -y timeshift

# Install git
echo "Installing git..."
zypper install -y git

# Install Google Chrome
echo "Installing Google Chrome..."
zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
wget https://dl.google.com/linux/linux_signing_key.pub
rpm --import linux_signing_key.pub
zypper refresh
zypper install -y google-chrome-stable

# Install VSCode
echo "Installing Visual Studio Code..."
rpm --import https://packages.microsoft.com/keys/microsoft.asc
zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode
zypper refresh
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

# Install Postman
echo "Installing Postman..."
wget https://dl.pstmn.io/download/latest/linux64 -O /tmp/postman.tar.gz
tar -xzf /tmp/postman.tar.gz -C /opt
ln -s /opt/Postman/Postman /usr/local/bin/postman
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Exec=postman
Comment=API Development Environment
Categories=Development;IDE;
Terminal=false
StartupWMClass=Postman" > /usr/share/applications/postman.desktop
rm /tmp/postman.tar.gz



# Install Wireshark
echo "Installing Wireshark..."
zypper install -y wireshark

echo "All software installed. Please reboot your system."
