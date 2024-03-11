#!/bin/bash
#
# The MIT License (MIT)
#
# Copyright (c) 2024 Sukalaper
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Refresh command options:
# -n 5: refresh after 5 seconds
# -t : no title
# -d : highlight changes between updates
  watch '-n 5' '-t' '-d' "

## Battery information
# Show battery percentage 
  bat_stat1=\$(cat /sys/class/power_supply/BAT0/capacity)
  bat_stat2=\$(cat /sys/class/power_supply/BAT1/capacity)
# Show charging status
  charger_status=\$(cat /sys/class/power_supply/AC/online)

# Show date
  date_now=\$(date)

# Show network
  wifi_stat=\$(nmcli connection show --active | awk '/wifi/ {printf \"%s %s %s\\n\", \$1, \$2, \$3}')

# Show uptime
  time_active=\$(uptime | awk -F 'up' '{print \$2}' | awk -F ',' '{print \$1}' | sed 's/^[ \\t]*//')

## Sensors information
# Show fan
  temp_fan=\$(sensors | grep -i \"fan\" | sort -nk2 | tail -n1 | awk '{print \$2}')
# Show temp
  temp_temp=\$(sensors | grep -i \"temp1\" | tail -n1 | awk '{print \$2}')

# Show program output
  if [ \"\$charger_status\" -eq 1 ]; then
    echo \"󰚥 : Charging\"
  else
    echo \"󰚦 : Discharging\"
  fi
  echo \" : \$bat_stat1%\"
  echo \" : \$bat_stat2%\"
  echo \" : \$date_now\"
  echo \" : \$wifi_stat\"
  echo \" : \$time_active\"
  echo \"󰈐 : \$temp_fan RPM\"
  echo \"󰔄 : \$temp_temp\"
"
