#!/bin/sh

# setup the keyboard to use the layout US with the variant ALT-GR
# international (that allows you to introduce most of the
# international chars needed in other layouts using the ALT-GR key)
# and maps the Capslock key as another Ctrl Key.
setxkbmap -layout us -variant altgr-intl -option ctrl:nocaps

# load the X11 configuration for urxvt and xterm
xrdb -merge ~/.Xresources

# start xcape to do that Ctrl key act like an Esc key when is pressed and
# released on its own
~/.bin/xcape

# start udiskie for usb drives automount
udiskie &

# start autocutsel to admin only one clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# start emacs as a daemon (if not already daemonized)
emacs --daemon &

# start the notification daemon dunst
dunst &

# hide the mouse cursor when is inactive
unclutter &

# start a compositor for X11
compton -b --config ~/.config/compton/compton.conf

# adjust the color temperature of the screen acording the daylight
# A Coruña coordinates
redshift -l 43.365:-8.41 & -t 6500:2700

# start urxvt as a daemon
urxvtd -q -o -f &

# start the tiling window manager awesome
exec awesome
