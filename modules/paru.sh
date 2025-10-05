#!/usr/bin/env bash

echo "Installing paru..."

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
