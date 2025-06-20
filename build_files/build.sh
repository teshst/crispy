#!/bin/bash

set -ouex pipefail

### Install packages

# this installs a package from fedora repos
dnf5 install -y nvim
dnf5 install -y steam
dnf5 install -y lutris

#Add the Flathub Flatpak remote and remove the Fedora Flatpak remote
flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
systemctl disable flatpak-add-fedora-repos.service

## Enabled System uni
systemctl enable podman.socket
