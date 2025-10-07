#!/bin/bash

# Variables
DOTFILES_REPO="https://github.com/jaycedam/dotfiles.git"
DOTFILES_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
BACKUP_DIR="${DOTFILES_DIR}.bak.$(date +%Y%m%d_%H%M%S)"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install it and try again."
    return 1
fi

# Check if .config exists
if [ -d "$DOTFILES_DIR" ]; then
    echo "Backup and install dotfiles to $DOTFILES_DIR? [y/n]"
    read -p "[y/n]: " choice
    case "$choice" in
        y|Y)
            # Check if directory is writable
            if [ ! -w "$(dirname "$DOTFILES_DIR")" ]; then
                echo "Error: Parent directory of $DOTFILES_DIR is not writable."
                return 1
            fi
            echo "Backing up existing dotfiles to $BACKUP_DIR..."
            if ! mv "$DOTFILES_DIR" "$BACKUP_DIR"; then
                echo "Error: Failed to back up $DOTFILES_DIR."
                return 1
            fi
            echo "Dotfiles backed up to $BACKUP_DIR"

            # Clone dotfiles repo
            echo "Cloning dotfiles from $DOTFILES_REPO to $DOTFILES_DIR..."
            if ! git clone "$DOTFILES_REPO" "$DOTFILES_DIR"; then
                echo "Error: Failed to clone dotfiles repo."
                return 1
            fi

            echo "Dotfiles installed successfully to $DOTFILES_DIR."
            echo "Backup created at $BACKUP_DIR."
            echo "Restart your shell or run 'hyprctl reload' (Hyprland) to apply changes."
            ;;
        n|N)
            echo "Skipping dotfiles installation."
            return 0
            ;;
        *)
            echo "Error: Invalid choice. Skipping dotfiles installation."
            return 1
            ;;
    esac
else
    # Clone dotfiles repo if .config doesn't exist
    echo "Cloning dotfiles from $DOTFILES_REPO to $DOTFILES_DIR..."
    if ! git clone "$DOTFILES_REPO" "$DOTFILES_DIR"; then
        echo "Error: Failed to clone dotfiles repo."
        return 1
    fi
    echo "Dotfiles installed successfully to $DOTFILES_DIR."
    echo "Restart your shell or run 'hyprctl reload' (Hyprland) to apply changes."
fi
