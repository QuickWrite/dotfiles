#!/bin/bash

set -euo pipefail

cd "$(dirname $0)"

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
light_red=$(tput setaf 9)
bold=$(tput bold)
reset=$(tput sgr0)

# Upgrading the system
pacman -Syu --needed --noconfirm

# Install Hyprland & stuff
pacman -S hyprland kitty rofi waybar --needed --noconfirm

# Install extra terminal apps
pacman -S btop yazi eza bat bat-extras vim man-pages --needed --noconfirm

