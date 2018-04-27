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

---------------------------------------------------------------
-- colours
---------------------------------------------------------------
myNormalBorderColor  = "#705129"
myFocusedBorderColor = "#A17917"

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
myManageHook :: ManageHook
myManageHook = composeAll
                [ fullscreenManageHook
                , manageDocks
                , isFullscreen                --> doFullFloat
                , className =? myEditorClass  --> doShift "code"
                , className =? myBrowserClass --> doShift "web"]

---------------------------------------------------------------
-- workspaces
---------------------------------------------------------------
myWorkspaces = ["code", "web", "3", "4", "5", "6", "7"]

---------------------------------------------------------------
-- main
---------------------------------------------------------------
main = do
    xmproc <- spawnPipe myStatusBar
    spawn myEditor
    spawn myBrowser
    
    xmonad $ defaultConfig
           {terminal           = myTerminal
           ,modMask            = mod4Mask
           ,normalBorderColor  = myNormalBorderColor
           ,focusedBorderColor = myFocusedBorderColor
           ,layoutHook         = desktopLayoutModifiers layout
           ,handleEventHook    = handleEventHook desktopConfig <+> fullscreenEventHook
           ,logHook            = ewmhDesktopsLogHook
           ,workspaces         = myWorkspaces
           ,startupHook        = ewmhDesktopsStartup
           ,manageHook         = myManageHook <+> manageHook defaultConfig
    }  `additionalKeys`
      -- mod+b - will hide the bar
      [ ((mod4Mask, xK_b), sendMessage ToggleStruts) ]
