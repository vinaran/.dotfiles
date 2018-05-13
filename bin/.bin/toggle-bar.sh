#!/bin/sh
# Toggles the bar xwindow on all workspaces.
#
# This script was created because the terminal windows are semi-transparent,
# so when they are made full-screen the bar is still slightly visible underneath,
# by removing the bar xwindow you no longer see the bar underneath.
#
# An issue with this approach is that all windows still respect the space the bar
# was using so there is a gap at the top of the workspace for the bar, you can
# manually remove this bar by toggling struts on the workspace(mod-key + b)

# Obtain bar's window id
id=$(xdo id -N "Polybar")

# Toggle bar visibility
if xprop -id $id | grep -q "HIDDEN"; then
    xprop -id $id -remove HIDDEN
    xdo show -N "Polybar"
else
    xdo hide -N "Polybar"
    xprop -id $id -f HIDDEN 8s -set HIDDEN true
fi
