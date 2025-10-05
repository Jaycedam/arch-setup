#!/usr/bin/env bash

PACKAGES=(
    # cli/tui
    fish
    fzf
    tmux
    zoxide
    yt-dlp
    yazi
    fd
    kanata-bin

    # browsers
    brave-bin

    # gaming
    steam
    heroic-games-launcher-bin

    # fonts
    otf-font-awesome
    ttf-jetbrains-mono

    # hyprland utils
    waybar
    dunst
    hyprpaper
    xdg-desktop-portal-hyprland
    udiskie
    hyprlock
    hypridle
    hyprpolkitagent
    pavucontrol

    # dev
    git
    tree-sitter-cli
    lazygit
    nodejs
    docker
    docker-compose
    github-cli
    # editors
    neovim
    helix

    # lsp
    pyright
    typescript-language-server
    gopls
    bash-language-server
)

# Update package database and upgrade system
echo "Updating package database and upgrading system..."
paru -Syu --noconfirm || {
    echo "Error: Failed to update system. Exiting."
    exit 1
}

echo "Installing packages: ${PACKAGES[*]}"
if paru -S --noconfirm "${PACKAGES[@]}"; then
    echo "✓ All packages installed successfully!"
else
    echo "✗ Installation completed with some errors (check output above)."
fi

echo "Done!"
