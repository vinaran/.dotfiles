import XMonad
import XMonad.Util.Run
import XMonad.Layout.NoBorders
import XMonad.Layout
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Fullscreen hiding (fullscreenEventHook)
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig

-- layout
layout = tall ||| wide ||| full
  where
    tall = smartBorders $ Tall 1 0.03 0.5
    wide = Mirror tall
    full = noBorders Full

main = do
    xmproc <- spawnPipe "sleep 0.1;polybar -r montecristo"  
    xmonad $ defaultConfig {
        terminal = "urxvt",
        modMask = mod4Mask,
        normalBorderColor = "#705129",
        focusedBorderColor = "#A17917",
        layoutHook = desktopLayoutModifiers layout,
        handleEventHook = handleEventHook desktopConfig <+> fullscreenEventHook
    }  `additionalKeys`
      -- mod+b - will hide the bar
      [ ((mod4Mask, xK_b), sendMessage ToggleStruts) ]
