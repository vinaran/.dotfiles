# load the .Xresources - this is where the urxvt solarized color scheme is defined 
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# set the background image
~/.fehbg

# set screen resolution
xbacklight -set 65

# start compton, needed for real transparency in urxvt
compton -CGb

# start xmonad
exec xmonad

# bind media keys to scripts e.g pushing volume up key will increase volume 
# key bindings are in ~/.xbindkeysrc and the scripts are in ~/bin
xbindkeys

