#!/usr/bin/env bash

PACKAGES=(
    # cli/tui
    git
    fish
    fzf
    tmux
    zoxide
    lazygit
    yt-dlp
    github-cli
    yazi
    tree-sitter-cli

    # fonts
    otf-font-awesome
    ttf-jetbrains-mono


    # editors
    neovim
    helix

    # hyprland utils
    waybar
    dunst
    hyprpaper
    xdg-desktop-portal-hyprland
    udiskie

    # dev
    nodejs
)

AUR_PACKAGES=(
    kanata-bin
    heroic-games-launcher-bin
)

# Update package database and upgrade system
echo "Updating package database and upgrading system..."
sudo pacman -Syu --noconfirm || {
    echo "Error: Failed to update system. Exiting."
    exit 1
}

echo "Installing packages: ${PACKAGES[*]}"
if sudo pacman -S --noconfirm "${PACKAGES[@]}"; then
    echo "✓ All packages installed successfully!"
else
    echo "✗ Installation completed with some errors (check output above)."
fi

echo "Installing packages: ${PACKAGES[*]}"
if paru -S --noconfirm "${AUR_PACKAGES[@]}"; then
    echo "✓ All AUR packages installed successfully!"
else
    echo "✗ Installation completed with some errors (check output above)."
fi

echo "Done!"
