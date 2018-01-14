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

