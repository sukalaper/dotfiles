#!/bin/bash

charger_status=$(cat /sys/class/power_supply/AC/online)

if [ $charger_status -eq 1 ]; then
  dunstify -u normal -t 2000 "Charger terhubung"
else
  dunstify -u normal "Charger terputus"
fi
