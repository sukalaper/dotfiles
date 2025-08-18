#!/bin/bash

capslock_state=$(xset q | grep "Caps Lock" | awk '{print $4}')

if [[ "$capslock_state" == "on" ]]; then
  dunstify -u critical -t 2000 "CapsLock: ON"
else
  dunstify -u normal "CapsLock: OFF"
fi
