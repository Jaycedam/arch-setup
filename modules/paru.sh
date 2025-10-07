#!/usr/bin/env bash

# Check if paru is installed
if command -v paru >/dev/null 2>&1; then
    echo "paru is already installed, skipping installation."
else
    echo "Installing paru..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/paru.git $HOME/paru
    cd $HOME/paru
    makepkg -si
    cd -
    echo "Done!"
fi

