
<h2 align="center">
No Place Like $HOME
</h2><br>


## Disclaimer 

Before, sorry for my bad English.

> _English is just a languange, not a parameter for measuring your intelligence. So if you don't know English, it's okay. That doesn't undermine your intellectual faculties._

I've only been studying Linux for a few decades, I'm not an IT guy, developer or anything. So, if I have a mistake please correct it and not turn around to insult me.


## Preview

![2024-03-05-070408_1920x1080_scrot](https://github.com/sukalaper/dotfiles/blob/main/Pictures/preview/home-1.png)

![2024-03-05-070408_1920x1080_scrot](https://github.com/sukalaper/dotfiles/blob/main/Pictures/preview/home-fullscreen.png)

![2024-03-05-070408_1920x1080_scrot](https://github.com/sukalaper/dotfiles/blob/main/Pictures/preview/home-rofi-app.png)

![2024-03-05-070408_1920x1080_scrot](https://github.com/sukalaper/dotfiles/blob/main/Pictures/preview/home-rofi-network.png)

![2024-03-05-070408_1920x1080_scrot](https://github.com/sukalaper/dotfiles/blob/main/Pictures/preview/home-rofi-powermenu.png)

![2024-03-05-070408_1920x1080_scrot](https://github.com/sukalaper/dotfiles/blob/main/Pictures/preview/home-floating.png)


## Details

- Machine : [ThinkPad X270](https://www.lenovo.com/id/in/laptops/thinkpad/thinkpad-x-series/ThinkPad-X270/p/22TP2TX2700)
  - OS : [Arch Linux](https://archlinux.org/)
  - Window Manager : [i3wm](https://i3wm.org/)
  - Font : [Fantasque Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FantasqueSansMono.zip)
  - Terminal : [Alacritty](https://github.com/alacritty)
  - Shell : [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))
  - App Launcher : [Rofi](https://github.com/davatorium/rofi)
  - Notification : [Dunst](https://github.com/dunst-project/dunst)
  - Text Editor : [Vi iMproved](https://www.vim.org/)
  - File Manager : [PcmanFM](https://en.wikipedia.org/wiki/PCMan_File_Manager)
  - Colorscheme : [Pywal](https://github.com/dylanaraps/pywal)


## Keyboard Mapping

Some are for basic knowledge.

| Set              | Key                                                     |  Exec                    |
|------------------|---------------------------------------------------------|--------------------------|
| **i3**               | <kbd>$super</kbd> + <kbd>q</kbd>                    | Exit                     |
|                  | <kbd>$super</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd>     | Restart / Refresh window |               |
|                  | <kbd>$super</kbd> + <kbd>r</kbd>                        | Resize                   |
|                  | <kbd>$super</kbd> + <kbd>h j k l</kbd>                  | Move focus window        |
| **Global**           | <kbd>$super</kbd> + <kbd>a</kbd>                    | Application list         |
|                  | <kbd>$super</kbd> + <kbd>p</kbd>                        | Powermenu                |
|                  | <kbd>$super</kbd> + <kbd>n</kbd>										     | Network                  |
|                  | <kbd>PrtSc</kbd>                                        | Screenshot               |
|									 | <kbd>$super</kbd> + <kbd>Shift</kbd> + <kbd>Enter</kbd> | Terminal                 |


## Introduction

Before that, allow me to make small talk first.

I used GNU/Linux more or less decades ago with [Linux Mint](https://linuxmint.com/), it was great! Gives me the impression that it's not too stiff when switching from Windows. I started to see some interesting views from some of the [friends here](https://t.me/s/dotfiles_id_channel?before=169). I decided to use [i3wm](https://i3wm.org/) on Linux Mint before migrating everything to Arch Linux.

Of course, everything seems stiff and heavy at first. However, we must open the door to potential experiences better. Not always closed and acting conservative but open on possibility.

Some very good guidelines (my version of course) for learning are.

1. https://bandithijo.dev/blog/i3wm-window-manager-yang-taktis-namun-praktis

2. https://github.com/addy-dclxvi/i3-starterpack

i3 is my first wm and I absolutely love it! Especially the tabbed and stacking features. This can be used immediately when you first install i3wm in full and without the need for any configuration, i promise.

Actually, I used the enclosure to boot the SSD with Arch inside. Considering that the X270 has M.2 built in, I just wanted to let Windows 11 rest in peace without disturbing it. Until finally, problems came and I was forced to use dual boot on it.

Approximately, this is what my partition looks like now.
```
NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
sda 8:0 0 119.2G 0 disk
├─sda1 8:1 0 7.8G 0 part
├─sda2 8:2 0 100M 0 part
├─sda3 8:3 0 16M 0 part
├─sda4 8:4 0 91.1G 0 part
├─sda5 8:5 0 674M 0 part
├─sda6 8:6 0 1G 0 part /boot
└─sda7 8:7 0 18.5G 0 part /
```
Sure, `sda6` and `sda7` are part of Arch. 

Oh no no! It looks like we're out of the documentation, let's move on~


## Installation

I personally only use [TTY](https://itsfoss.com/what-is-tty-in-linux/) to execute `startx`. Some configuration scripts are in `~/.local/bin` you can configure those later. Fonts can be found in `~/.local/share/fonts` and several other settings can also be found in files starting with a dot (`.`).

I assume you have successfully installed Arch and are currently on another [Desktop Environment](https://en.wikipedia.org/wiki/Desktop_environment) / [Window Manager](https://wiki.archlinux.org/title/window_manager). We need several packages here, because I use Arch which means everything is under [pacman](https://wiki.archlinux.org/title/pacman). Oh, don't forget [AUR](https://aur.archlinux.org/)! Do it all in one command.

```
$ sudo pacman -S i3-wm python-pywal alacritty dunst eza feh flameshot gucharmap imagemagick alsa-utils alsa-lib lxappearance pcmanfm wget git networkmanager xorg-xinit xorg-xset xclip libnotify dunst rofi xorg-server brightnessctl firefox
```

Cool, you're ready now!

Then.. what about the workspace? As in general, I don't stick to a few rules.

It's universal, I can open [WPS](https://wiki.archlinux.org/title/WPS_Office) on workspace 1 and terminal on workspace 4 (for example), sure. This is as random and free as possible configuration that I have. I previously used [polybar](https://github.com/polybar/polybar) as the bar. However, for several reasons, I want to take advantage of [i3wm scratchpad feature](https://i3wm.org/docs/userguide.html#_scratchpad) to use the bar with the Bash script I write (`stat-bar.sh`). 

```bash
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
  # Print output
  [[ -n $vol ]] && { echo 󰕾 : $vol; } || echo 󰕾 : not found

# Network
  # Get value from nmcli and trim the name
  # So the first 1-3 sentences are used
  wifi_stat=$(nmcli connection show --active | awk '/wifi/ {printf "%s %s %s\n", $1, $2, $3}')
  # Print output
  [[ -n $wifi_stat ]] && { echo  : $wifi_stat; } ||  echo  : not found!

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
  # Print output
  [[ -n $temp_now ]] && { echo 󰔄 : $temp_now; } || echo 󰔄 : -
  ```
