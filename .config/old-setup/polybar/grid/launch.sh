#!/usr/bin/env bash

# Terminate already running bar intances
killall -q polybar 

# Wait untill the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar -r main -c $HOME/.config/polybar/grid/config.ini &
