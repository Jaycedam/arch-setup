#!/usr/bin/env bash

# start services with systemd when using uwsm

echo "Enabling services with systemd..."
systemctl --user enable waybar.service
systemctl --user enable hyprpaper.service
systemctl --user enable hypridle.service
systemctl --user enable hyprpolkitagent.service
systemctl --user enable hyprsunset.service
