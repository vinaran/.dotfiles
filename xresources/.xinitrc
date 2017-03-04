# load the .Xresources - this is where the urxvt solarized color scheme is defined 
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# set the resolution
xrandr --output VGA-1 --mode 1920x1200

# set the background image
~/.fehbg

# start virtualbox service
# this gives the ability to copy/paste between the guest and host 
VBoxClient-all

# start xmonad
exec xmonad
