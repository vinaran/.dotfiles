#!/bin/bash

# Install all packages needed for my arch install.
# I created these scripts because I had difficulty tracking what I
# had installed and how programs were configured, the programs
# that are installed here are configured by the config files in the
# .dotfiles directory.
./install-packages.sh
./install-aura.sh
./install-aur-packages.sh
./install-fonts.sh   
