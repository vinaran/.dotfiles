dotfiles
========

Config files I use for my current environment(arch + xmonad).
I use stow(http://www.gnu.org/software/stow/) to apply my config.

##### xmonad
config for xmonad tiling window system
##### xresources
config for all Xresources(https://wiki.archlinux.org/index.php/x_resources)
contains the following config files:
- .Xresources.d
contains xresources.d/urxvt, config for urxvt terminal
defines solarized color scheme for terminal colors
- .Xresources
entry point for all xresource config files
load new changes using `xrdb ~/.Xresources`
currently this just loads my urxvt config
- .xinitrc
starts the xmonad tiling system
runs .Xresources file described aboove
sets background(depends on **fehbg**)
sets resolution using xrandr
starts virtualbox service
##### fehbg
sets background image for xmonad
also contains background images
gets called in `.xinitrc` in xresources
##### dircolors
defines the color of different files when viewed using `ls --color=auto` 
gets called in `.bashrc`
##### bashrc
loads dircolors
sets up alias for firefox
##### polybar
config for polybar
##### xbindkeys
binds multimedia keys to action scripts, e.g pushing the volume-up key will
call `~/bin/volume.sh up` and increment the volume,
the .xinitrc file contains the call to `xbindkeys` which will read the
source file in `~/.xbindkeysrc`
