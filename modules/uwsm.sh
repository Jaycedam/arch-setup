#!/usr/bin/env bash

# start services with systemd when using uwsm

systemctl --user enable --now waybar.service
systemctl --user enable --now hyprpaper.service
systemctl --user enable --now hypridle.service
systemctl --user enable --now hyprpolkitagent.service
