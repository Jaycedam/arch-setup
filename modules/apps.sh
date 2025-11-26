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
    wine
    flatpak
    lsfg-vk-bin
    7zip
    grim
    slurp
    fwupd
    fastfetch
    swayimg
    timeshift xorg-xhost

    # desktop
    signal-desktop
    gimp
    mpv
    libreoffice-still
    transmission-qt
    cryptomator-bin
    ente-desktop-bin
    grayjay-bin
    localsend-bin

    # terminal emulators
    kitty
    ghostty

    ### browser ###
    brave-bin
    zen-browser-bin

    ### gaming ###
    steam
    lutris
    gamemode
    lib32-gamemode
    gamescope
    lib32-gnutls
    dolphin-emu
    shadps4-bin
    gopher64-bin
    heroic-games-launcher-bin
    protonup-qt-bin
    pcsx2-latest-bin

    ### fonts ###
    otf-font-awesome
    ttf-jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-extra

    # themes
    catppuccin-gtk-theme-mocha

    ### hyprland and utilities ###
    hyprland
    waybar
    dunst
    hyprpaper
    hyprlauncher
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    udiskie
    hyprlock
    hypridle
    hyprsunset
    hyprpolkitagent
    pavucontrol
    rofi
    nwg-look
    swayosd

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

echo "Done!"
