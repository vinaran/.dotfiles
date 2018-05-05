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
import XMonad.Actions.SpawnOn
import XMonad.Hooks.FadeWindows

---------------------------------------------------------------
-- colours
---------------------------------------------------------------
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#000000"
myBorderWidth = 3

---------------------------------------------------------------
-- applications
---------------------------------------------------------------
myStatusBar    = "sleep 0.1;polybar -r montecristo"
myBrowser      = "firefox"
myBrowserClass = "Firefox"
myEditor       = "emacs"
myEditorClass  = "Emacs"
myTerminal     = "urxvt"

---------------------------------------------------------------
-- layout
---------------------------------------------------------------
layout = tall ||| wide ||| full
  where
    tall = smartBorders $ Tall 1 0.03 0.5
    wide = Mirror tall
    full = noBorders Full

---------------------------------------------------------------
-- hooks
---------------------------------------------------------------
myStartupHook = spawnOn myCodeWorkspace myEditor
                >> spawnOn myWebWorkspace myBrowser

myFadeHook = composeAll
    [ opaque,
    (className =? "URxvt") --> opacity 0.77]

myLogHook = fadeWindowsLogHook myFadeHook

---------------------------------------------------------------
-- workspaces
---------------------------------------------------------------
myCodeWorkspace = "code"
myWebWorkspace  = "web"
myWorkspaces    = [myCodeWorkspace, myWebWorkspace, "3", "4", "5", "6", "7"]

---------------------------------------------------------------
-- main
---------------------------------------------------------------
main = do
    xmproc <- spawnPipe myStatusBar

    xmonad
        $ defaultConfig
           {terminal           = myTerminal
           ,modMask            = mod4Mask
           ,normalBorderColor  = myNormalBorderColor
           ,focusedBorderColor = myFocusedBorderColor
           ,borderWidth        = myBorderWidth
           ,layoutHook         = desktopLayoutModifiers layout
           ,handleEventHook    = handleEventHook desktopConfig <+> fullscreenEventHook
           ,logHook            = myLogHook <+> ewmhDesktopsLogHook
           ,workspaces         = myWorkspaces
           ,startupHook        = myStartupHook <+> ewmhDesktopsStartup
           ,manageHook         = manageSpawn <+> manageHook defaultConfig
           }  `additionalKeys`
           -- mod+b - will hide the bar
           [ ((mod4Mask, xK_b), sendMessage ToggleStruts) ]
