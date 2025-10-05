#!/usr/bin/env bash

ROOT_DIR="$(dirname "${BASH_SOURCE[0]}")"
MODULES_DIR="${ROOT_DIR}/modules"

source "${MODULES_DIR}/apps.sh"
source "${MODULES_DIR}/paru.sh"

# todo: uncommend color and multilib from /etc/pacman.conf
# todo: clone dotfiles repo

# change default shell to fish
chsh -s /usr/bin/fish

