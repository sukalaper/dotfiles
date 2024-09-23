#!/bin/sh

  userresources=$HOME/.Xresources
  usermodmap=$HOME/.Xmodmap
  sysresources=/usr/X11R6/lib/X11/xinit/.Xresources
  sysmodmap=/usr/X11R6/lib/X11/xinit/.Xmodmap

# Merge in defaults and keymaps
  if [ -f $sysresources ]; then
      xrdb -merge $sysresources
  fi

  if [ -f $sysmodmap ]; then
      xmodmap $sysmodmap
  fi

  if [ -f $userresources ]; then
      xrdb -merge $userresources
  fi

  if [ -f $usermodmap ]; then
      xmodmap $usermodmap
  fi

# Clipmenu Environment Variables
# https://bandithijo.dev/blog/manajemen-clipboard-dengan-clipmenu
  pkill -f "bash /usr/bin/clipmenud"; pkill -f "clipnotify"; /usr/bin/clipmenud &
  export CM_LAUNCHER=$HOME/.config/rofi/bin/clipmenu
  export CM_DIR=$HOME/tmp

# Start i3
  exec i3
