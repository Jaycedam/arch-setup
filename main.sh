#!/usr/bin/env bash

ROOT_DIR="$(dirname "${BASH_SOURCE[0]}")"
MODULES_DIR="${ROOT_DIR}/modules"

source "${MODULES_DIR}/paru.sh"
source "${MODULES_DIR}/apps.sh"
source "${MODULES_DIR}/dotfiles.sh"

# todo: uncommend color and multilib from /etc/pacman.conf

# change default shell to fish
chsh -s /usr/bin/fish

