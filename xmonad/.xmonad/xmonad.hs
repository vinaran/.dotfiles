import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.DecorationMadness
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Hooks.ManageHelpers 

main = do
    xmproc <- spawnPipe "sleep 0.1;polybar -r montecristo"  
    xmonad $ defaultConfig {
        terminal = "urxvt",
        modMask = mod4Mask
    }
