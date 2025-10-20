#!/usr/bin/env bash

# todo: separate on files per category
PACKAGES=(
    ### cli ###
    fish
    btop
    fzf
    tldr
    tmux
    ripgrep
    zoxide
    yt-dlp
    ffmpeg
    yazi
    bat
    fd
    kanata-bin
    openssh
    dmidecode
    imagemagick
    typst
    pacman-contrib
    flatpak

    # desktop
    signal-desktop
    gimp
    mpv
    libreoffice-still
    transmission-qt

    # terminal emulators
    kitty
    ghostty

    ### browser ###
    brave-bin

    ### gaming ###
    steam

    ### fonts ###
    otf-font-awesome
    ttf-jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-extra

    ### hyprland and utilities ###
    waybar
    dunst
    hyprpaper
    hyprlauncher
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    udiskie
    hyprlock
    hypridle
    hyprpolkitagent
    pavucontrol
    rofi

    ### dev ###
    # tools
    git
    bun-bin
    tree-sitter-cli
    lazygit
    nodejs
    docker
    docker-compose
    android-tools
    github-cli
    # ai
    opencode-bin
    gemini-cli-bin
    # editors
    neovim
    helix
    zed
    # languages
    go

    # lsp
    pyright
    vscode-langservers-extracted
    typescript-language-server
    rust-analyzer
    astrojs-language-server
    gopls
    bash-language-server
    marksman
    tailwindcss-language-server
    yaml-language-server
    lua-language-server
    taplo-cli
    # formatters
    prettier
    ruff
    python-djlint
    shfmt
    stylua
    python-black
    # linters
    eslint
    shellcheck
)

FLATPAKS=(
    app.zen_browser.zen
    org.cryptomator.Cryptomator
    io.ente.photos
    app.grayjay.Grayjay
    org.localsend.localsend_app
    com.github.tchx84.Flatseal
    com.heroicgameslauncher.hgl
)

# Update package database and upgrade system
echo "Updating package database and upgrading system..."
paru -Syu --noconfirm || {
    echo "Error: Failed to update system. Exiting."
    exit 1
}

echo "Installing packages: ${PACKAGES[*]}"
if paru -S --needed --noconfirm "${PACKAGES[@]}"; then
    echo "✓ All packages installed successfully!"
else
    echo "✗ Installation completed with some errors (check output above)."
fi

echo "Installing flatpaks: ${FLATPAKS[*]}"
if flatpak install -y "${FLATPAKS[@]}"; then
    echo "✓ All flatpaks installed successfully!"
else
    echo "✗ Installation completed with some errors (check output above)."
fi

echo "Done!"
