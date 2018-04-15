import XMonad
import XMonad.Util.Run

main = do
    xmproc <- spawnPipe "sleep 0.1;polybar -r montecristo"  
    xmonad $ defaultConfig {
        terminal = "urxvt",
        modMask = mod4Mask
    }
