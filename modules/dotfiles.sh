#!/usr/bin/env bash

DOTFILES_REPO="https://github.com/jaycedam/dotfiles.git"
DOTFILES_DIR="${HOME}/.config"

echo "Backing up existing dotfiles..."
mv "${DOTFILES_DIR}" "${DOTFILES_DIR}.bak" || {
    echo "Error: Failed to backup existing dotfiles. Exiting."
    exit 1
}

echo "Cloning dotfiles repo..."
git clone "${DOTFILES_REPO}" "${DOTFILES_DIR}" || {
    echo "Error: Failed to clone dotfiles repo. Exiting."
    exit 1
}

