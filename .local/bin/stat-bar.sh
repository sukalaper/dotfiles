#!/bin/bash -e

# The MIT License (MIT)
# https://opensource.org/license/mit
# Copyright (c) 2024 Sukalaper
#
# Reference: 
# https://github.com/dylanaraps/pure-bash-bible
# https://www.nerdfonts.com/cheat-sheet

# Make your own status bar
  echo "An itsy bitsy status bar~"
  echo "-------------------------"
  
# Battery
  # Get value from /sys/class/power_supply/capacity
  bat1=$(cat /sys/class/power_supply/BAT0/capacity)
  bat2=$(cat /sys/class/power_supply/BAT1/capacity)
  # Print output 
  [[ -n $bat1 && -n $bat2 ]] && { echo  : $bat1; echo  : $bat2; } || echo Something wrong..

# AC Status
  # Get value from /sys/class/power_supply/AC/online
  # If the value is 1, it is filled in and vice versa
  charger_status=$(cat /sys/class/power_supply/AC/online)
  # Print output
  [[ $charger_status -eq 1 ]] && { echo 󰚥 : Charging; } || echo 󰚦 : Discharging

# Date
  # Get value from $date 
  date_now=$(date)
  # Print output
  [[ -n $date_now ]] && { echo  : $date_now; } || echo  : $date_now not found

# Volume 
  # Get value from amixer
  vol=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
  [[ -n $vol ]] && { echo 󰕾 : $vol; } || echo 󰕾 : not found

# Brightness
  # Get value from brightnessctl
  bright_disp=$(brightnessctl i | grep -E -o '[0-9]{1,3}%')
  # Print output
  [[ -n $bright_disp ]] && { echo 󰃠 : $bright_disp; } || echo 󰃠 : not found

# Network
  # Get value from nmcli and trim the name
  # So the first 1-3 sentences are used
  wifi_stat=$(nmcli connection show --active | awk '/wifi/ {print $1,$2,$3}' | cut -d ' ' -f 1-3)
  # Print output
  [[ -n $wifi_stat ]] && { echo  : $wifi_stat; } ||  echo  : not found!

# Memory usage
  # Get value from ps_mem
  mem_usage=$(sudo ps_mem | tail -n 2 | sed 's/ //g' |  sed '/^=*$/d')
  # Print output
  [[ -n $mem_usage ]] && { echo 󰍛 : $mem_usage; } || echo 󰍛 : not found!

# Uptime
  # Get value from $uptime and trim the output 
  # Until only hours:minutes are displayed
  time_active=$(uptime | awk -F 'up' '{print $2}' | awk -F ',' '{print $1}' | sed 's/^[ \\t]*//')
  # Print output
  [[ -n $time_active ]] && { echo  : $time_active; } || echo  : -

# Sensors
# Show fan speed
  # Get value fan from $sensors and trim the output
  temp_fan=$(sensors | grep -i "fan" | awk '{print $2}')
  # Print output
  [[ -n $temp_fan ]] && { echo 󰈐 : $temp_fan RPM; } || echo 󰈐 : -
# Show temperature
  # Get value temp from $sensors and trim the output
  temp_now=$(sensors | grep -i "temp1" | tail -n1 | awk '{print $2}')
  [[ -n $temp_now ]] && { echo 󰔄 : $temp_now; } || echo 󰔄 : -
