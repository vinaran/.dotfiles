#!/bin/bash

# install aura(arch user repository) package manager
mkdir ~/.temp
cd ~/.temp
curl https://aur.archlinux.org/cgit/aur.git/snapshot/aura.tar.gz --output aura.tar.gz
tar -zxvf
cd aura
makepkg -si
