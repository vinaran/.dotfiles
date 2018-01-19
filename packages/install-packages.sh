#!/bin/bash

# installs packages I need for my Arch environment,
# after running this script run 'stow-all.sh' to install
# the config required for these programs

# install display manager
pacman -S --noconfirm xorg-server xorg-server-utils xorg-xinit xorg-twm

# firefox
pacman -S --noconfirm firefox
# for audio to work on firefox you also need to install pulseaudio
pacman -S pulseaudio

# urxvt terminal
pacman -S --noconfirm rxvt-unicode

# background image manager
pacman -S --noconfirm feh

# xmonad tiling window manager
pacman -S --noconfirm xmonad

# used to manage dot files
pacman -S --noconfirm stow

# git
pacman -S --noconfirm git

# urxvt extensions(keyboard-select, url-select)
pacman -S --noconfirm urxvt-perls
