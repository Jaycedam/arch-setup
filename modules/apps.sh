#!/usr/bin/env bash

# todo: separate on files per category
PACKAGES=(
    ### cli ###
    impala # wifi tui selector
    fish
    btop
    fzf
    trash-cli
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
    less
    dmidecode
    jq
    imagemagick
    typst
    pacman-contrib
    wine
    flatpak
    lsfg-vk-bin # only git version on chaotic
    7zip
    grim slurp
    fwupd
    fastfetch
    reflector
    sunshine-beta-bin

    # desktop
    signal-desktop
    gimp
    mpv
    libreoffice-still
    transmission-gtk
    cryptomator
    ente-desktop-bin
    grayjay-bin
    localsend
    timeshift xorg-xhost
    thunar thunar-media-tags-plugin

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
    shadps4-bin # check chaotic differences
    gopher64
    heroic-games-launcher-bin
    protonup-qt
    pcsx2-latest-bin # chaotic only has git version

    ### fonts ###
    otf-font-awesome
    ttf-jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    noto-fonts-extra
    apple-font

    # themes
    graphite-gtk-theme-black-compact-git

    ### hyprland and utilities ###
    hyprland hyprlock hypridle hyprsunset hyprpaper hyprlauncher hyprpolkitagent
    waybar
    dunst
    xdg-desktop-portal xdg-desktop-portal-hyprland
    udiskie
    pavucontrol
    rofi
    nwg-look

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
    gemini-cli
    # editors
    # neovim # waiting for native package manager availability
    neovim-nightly-bin
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
sudo pacman -Syu --noconfirm || {
    echo "Error: Failed to update system. Exiting."
    exit 1
}

# AUR helper
echo "Installing yay..."
sudo pacman -S yay --needed --noconfirm

echo "Installing packages: ${PACKAGES[*]}"
if yay -S --needed --noconfirm "${PACKAGES[@]}"; then
    echo "✓ All packages installed successfully!"
else
    echo "✗ Installation completed with some errors (check output above)."
fi

echo "Done!"
