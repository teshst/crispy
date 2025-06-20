#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y nvim
dnf5 install -y steam
dnf5 install -y lutris

#Add the Flathub Flatpak remote and remove the Fedora Flatpak remote
flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
systemctl disable flatpak-add-fedora-repos.service

## Install flatpaks
flatpak install com.discordapp.Discord -y
flatpak install com.mattjakeman.ExtensionManager -y
flatpak install io.missioncenter.MissionCenter -y
flatpak install com.brave.Browser

## Enabled System uni
systemctl enable podman.socket
