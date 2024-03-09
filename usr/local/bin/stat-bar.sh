#!/bin/bash

# Battery percentage information
  bat_stat1=$(cat /sys/class/power_supply/BAT0/capacity)
  bat_stat2=$(cat /sys/class/power_supply/BAT1/capacity)

# Date
  date_now=$(date)

# Network
  wifi_stat=$(nmcli connection show --active | awk '/wifi/ {print $1}')

# Uptime
  time_active=$(uptime | awk -F 'up' '{print $2}' | awk -F ',' '{print $1}' | sed 's/^[ \t]*//')

## Sensors
# Fan
  temp_fan=$(sensors | grep -i "fan" | sort -nk2 | tail -n1 | awk '{print $2}')
# Temp
  temp_temp=$(sensors | grep -i "temp1" | tail -n1 | awk '{print $2}')
  #temp_fan_stat=$((sensors | grep -i "fan" && sensors | grep -Ei 'temp1' | sort -nk2 | tail -n1) | awk '{print $2}')

# Show program
  echo " : $bat_stat1%"
  echo " : $bat_stat2%"
  echo " : $date_now"
  echo " : $wifi_stat"
  echo " : $time_active"
  echo "󰈐 : $temp_fan RPM"
  echo "󰔄 : $temp_temp"
