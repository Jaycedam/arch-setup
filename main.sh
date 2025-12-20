#!/usr/bin/env bash

ROOT_DIR="$(dirname "${BASH_SOURCE[0]}")"
MODULES_DIR="${ROOT_DIR}/modules"

# todo: enable 32-bit support

source "${MODULES_DIR}/tty-colemak-dh-iso.sh"
source "${MODULES_DIR}/chaotic-aur.sh"
source "${MODULES_DIR}/dotfiles.sh"
source "${MODULES_DIR}/apps.sh"
source "${MODULES_DIR}/uwsm.sh"
source "${MODULES_DIR}/themes.sh"
source "${MODULES_DIR}/fish-shell.sh"

# todo: uncommend color and multilib from /etc/pacman.conf

# change default shell to fish
# todo: check if fish is installed and set as default shell
# chsh -s /usr/bin/fish
