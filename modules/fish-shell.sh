#!/usr/bin/env bash

# Get the current default shell
current_shell="$(getent passwd "$USER" | cut -d: -f7)"

# Dynamically get the path of Fish shell
desired_shell="$(which fish)"

# Check if the current shell is not Fish
if [ "$current_shell" != "$desired_shell" ]; then
    echo "Changing default shell from $current_shell to Fish..."

    # Change the default shell to Fish
    chsh -s "$desired_shell"

    echo "Default shell successfully changed to Fish."
else
    echo "Default shell is already set to Fish."
fi
