#!/bin/bash

# install material-design icons, used by polybar:
#   https://materialdesignicons.com/
# use this website to load the TTF file and view the charmap:
#   http://bluejamesbond.github.io/CharacterMap/
#
# use 'fc-list' to check which fonts are installed,
# polybar uses 'fc-match' to find a font, so if the font is not
# being detected, check that you can find it using 'fc-match'
mkdir ~/.temp
cd ~/.temp
curl "https://github.com/Templarian/MaterialDesign-Webfont/archive/master.zip" --output master.zip
unzip master.zip
cd MaterialDesign-Webfont-master/fonts
cp materialdesignicons-webfont.ttf /usr/share/fonts/TTF/

#update the font cache
fc-cache

# primary font used by urxvt and emacs
pacman -S --noconfirm adobe-source-code-pro-fonts

# another good font, sometimes used instead of adobe-source-code
pacman -S --noconfirm ttf-roboto
