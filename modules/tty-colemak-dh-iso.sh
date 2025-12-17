#!/usr/bin/env bash

VCONF="/etc/vconsole.conf"
TARGET="KEYMAP=colemak/mod-dh-iso-us"

# If KEYMAP already set to desired value, nothing to do
if grep -qE "^KEYMAP=${TARGET#KEYMAP=}$" "$VCONF" 2>/dev/null; then
    echo "TTY keyboard layout already set. Skipping..."
    return
fi

# If any KEYMAP line exists, replace it with the target (requires sudo for file write)
if grep -qE "^KEYMAP=" "$VCONF" 2>/dev/null; then
    echo "colemak not set"
    sudo sed -i "s|^KEYMAP=.*|${TARGET}|" "$VCONF"
else
    # No KEYMAP line found: append the target line as root.
    # printf prints the line with a newline,
    # sudo tee -a appends it to the file with root permissions,
    # > /dev/null hides tee's stdout.
    echo "line missing adding it"
    printf '%s\n' "${TARGET}" | sudo tee -a "$VCONF" >/dev/null
fi

echo "Updated $VCONF to ${TARGET}."
