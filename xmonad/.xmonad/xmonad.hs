import XMonad
import XMonad.Util.Run
import XMonad.Layout.NoBorders
import XMonad.Layout
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops hiding (fullscreenEventHook)
import XMonad.Layout.Fullscreen
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Layout.Fullscreen
import XMonad.Hooks.ManageHelpers

-- layout
layout = tall ||| wide ||| full
  where
    tall = smartBorders $ Tall 1 0.03 0.5
    wide = Mirror tall
    full = noBorders Full

-- hooks
myManageHook :: ManageHook
myManageHook = composeAll
                [ isFullscreen          --> doFullFloat,
                className =? "Emacs"    --> doShift "code",
                className =? "Firefox"    --> doShift "web",
                fullscreenManageHook,
                manageDocks
                ]

main = do
    xmproc <- spawnPipe "sleep 0.1;polybar -r montecristo"
    spawn "emacs"
    spawn "firefox"
    
    xmonad $ defaultConfig {
        terminal = "urxvt",
        modMask = mod4Mask,
        normalBorderColor = "#705129",
        focusedBorderColor = "#A17917",
        layoutHook = desktopLayoutModifiers layout,
        handleEventHook = handleEventHook desktopConfig <+> fullscreenEventHook,
        logHook = ewmhDesktopsLogHook,
        workspaces = ["code", "web", "3", "4", "5", "6", "7"],
        startupHook = ewmhDesktopsStartup,
        manageHook = myManageHook <+> manageHook defaultConfig
    }  `additionalKeys`
      -- mod+b - will hide the bar
      [ ((mod4Mask, xK_b), sendMessage ToggleStruts) ]
