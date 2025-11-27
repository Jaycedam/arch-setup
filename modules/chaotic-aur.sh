#!/usr/bin/env bash

echo "Installing chaotic-aur..."

# retrieve chaotic-aur key
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

# Install chaotic-keyring if not already installed
if ! pacman -Q chaotic-keyring >/dev/null 2>&1; then
    echo "Installing chaotic-keyring..."
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
else
    echo "chaotic-keyring already installed."
fi

# Install chaotic-mirrorlist if not already installed
if ! pacman -Q chaotic-mirrorlist >/dev/null 2>&1; then
    echo "Installing chaotic-mirrorlist..."
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
else
    echo "chaotic-mirrorlist already installed."
fi

# add chaotic-aur to pacman.conf if it's not already there
if ! grep -q "^\[chaotic-aur\]" /etc/pacman.conf; then
    echo "" | sudo tee -a /etc/pacman.conf >/dev/null
    echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf >/dev/null
    echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf >/dev/null
fi
