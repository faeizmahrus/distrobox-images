#!/bin/bash

# Download VSCode, Obsidian and OnlyOffice
curl -L -o 'vscode-x64.deb' 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
curl -L -o 'obsidian-x64.deb' 'https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.7/obsidian_1.7.7_amd64.deb'
curl -L -o 'onlyoffice-x64.deb' 'https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb'

# Update apt
apt update && apt upgrade -y

# Install VSCode
apt install -y 'vscode-x64.deb'
apt install -y git

# Install Obsidian and install extras
apt install -y 'obsidian-x64.deb'
apt install -y pandoc texlive

# Install OnlyOffice
apt install -y 'onlyoffice-x64.deb'
apt install -y ttf-mscorefonts-installer

# Create installer script
touch /usr/bin/appbox-export && chmod +x /usr/bin/appbox-export && \
echo '#!/bin/bash' >> /usr/bin/distrobox-export-all && \
echo 'distrobox-export-electron code' >> /usr/bin/distrobox-export-all && \
echo 'distrobox-export-electron obsidian' >> /usr/bin/distrobox-export-all && \
echo 'distrobox-export-electron onlyoffice-desktopeditors' >> /usr/bin/distrobox-export-all