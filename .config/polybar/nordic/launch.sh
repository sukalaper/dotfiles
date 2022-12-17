#!/usr/bin/env bash

# Terminate already running bar instances
 killall polybar

# Wait until the processes have been shut down
while pgrep -U $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -c "$HOME"/.config/polybar/nordic/config.ini & 
