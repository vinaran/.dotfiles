dotfiles
========

Config files I use for my current environment(arch + xmonad).

### install
Run the main install script `packages/install.sh` script,
this will install all required programs/packages/fonts.

After the programs have been installed, they still need to be
configured.

I use stow(http://www.gnu.org/software/stow/) to apply my config,
it is installed as part of the install scripts.

Run `./stow-all.sh` to create the config files for the programs.

### config files

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

### packages

##### install-packages.sh
installs packages from the offical arch repo using pacman:
https://www.archlinux.org/packages/

##### install-aura.sh
aura is a package manager for the arch user repository, this is for unoffical
packages that arch users might find useful but are not available in the offical
repo:https://aur.archlinux.org/

##### install-aur-packages.sh
install packages from the aur

##### install-fonts.sh
install fonts, this installs fonts from the official and user repo.
