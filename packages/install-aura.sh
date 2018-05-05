#!/bin/bash
# Install aura(arch user repository) package manager
# this package is not available in the official repo, so we need to install it
# manually

mkdir ~/.temp
cd ~/.temp
curl https://aur.archlinux.org/cgit/aur.git/snapshot/aura.tar.gz --output aura.tar.gz
tar -zxvf
cd aura
makepkg -si
