#!/bin/sh

# Fix dnf stuff
echo "max_parallel_downloads = 20" >> /etc/dnf/dnf.conf
echo "minrate = 262144" >> /etc/dnf/dnf.conf
echo "timeout = 5" >> /etc/dnf/dnf.conf

# Install RPMFusion repos
dnf update -y
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf swap -y "rpmfusion-free-release-$(rpm -E %fedora)" rpmfusion-free-release
dnf swap -y "rpmfusion-nonfree-release-$(rpm -E %fedora)" rpmfusion-nonfree-release
dnf install -y rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted
dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Install drivers and stuff
dnf install -y ffmpeg intel-media-driver libva-intel-driver intel-compute-runtime clinfo
dnf swap -y mesa-va-drivers mesa-va-drivers-freeworld
dnf swap -y mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
dnf install -y dnf-plugins-core

# Add other repos
# Brave Browser
dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
# VS Code
dnf config-manager addrepo --from-repofile=https://packages.microsoft.com/yumrepos/vscode/config.repo

# COPRs
dnf copr enable alxhr0/Obsidian 
dnf copr enable mozes/zotero7
