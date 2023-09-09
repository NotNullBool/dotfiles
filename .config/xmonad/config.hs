import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Hooks.EwmhDesktops

main :: IO ()
main = xmonad $ ewmh def
    { modMask = mod4Mask
    , terminal = "kitty"
    } `additionalKeysP` [("M-p", spawn "rofi -show combi -modi combi")]
