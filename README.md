# No Place Like `$HOME`

## Disclaimer 

Before, sorry for my bad English.

> _English is just a languange, not a parameter for measuring your intelligence. So if you don't know English, it's okay. That doesn't undermine your intellectual faculties._

I've only been studying Linux for a few decades. I'm not an IT guy, developer, or anything like that. So, if I make a mistake, please correct it without insulting me.

## Preview

![2024-03-05-070408_1920x1080_scrot](https://github.com/sukalaper/dotfiles/blob/main/Pictures/preview/home.png)

![2024-03-05-070408_1920x1080_scrot](https://github.com/sukalaper/dotfiles/blob/main/Pictures/preview/home-2.png)



## Details

- Machine : [ThinkPad X270](https://www.lenovo.com/id/in/laptops/thinkpad/thinkpad-x-series/ThinkPad-X270/p/22TP2TX2700)
  - OS : [Arch Linux](https://archlinux.org/)
  - Window Manager : [i3wm](https://i3wm.org/)
  - Font : [Fantasque Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FantasqueSansMono.zip)
  - Terminal : [St](https://st.suckless.org/)
  - Shell : [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))
  - App Launcher : [Rofi](https://github.com/davatorium/rofi)
  - Notification : [Dunst](https://github.com/dunst-project/dunst)
  - Text Editor : [Vi iMproved](https://www.vim.org/)
  - File Manager : [PcmanFM](https://en.wikipedia.org/wiki/PCMan_File_Manager)
  - Colorscheme : [Pywal](https://github.com/dylanaraps/pywal)


## Keyboard Mapping

Some of the resources are intended for basic understanding.

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

Before we begin, may I engage in some small talk first?

I used GNU/Linux more or less decades ago with [Linux Mint](https://linuxmint.com/), and it was great! It gave me the impression that transitioning from Windows wasn't too difficult. I began to explore some interesting perspectives from [friends here](https://t.me/s/dotfiles_id_channel?before=169). Eventually, I decided to use [i3wm](https://i3wm.org/) on Linux Mint before migrating everything to Arch Linux.
Of course, everything seems stiff and heavy at first. However, we should open ourselves to new experiences. Instead of always being closed-minded and conservative, let's be open to possibilities.

Here are some very good guidelines (my version, of course) for learning.

1. https://bandithijo.dev/blog/i3wm-window-manager-yang-taktis-namun-praktis

2. https://github.com/addy-dclxvi/i3-starterpack

i3 is my first window manager, and I absolutely love it! Especially the tabbed and stacking features. These features can be used immediately upon installing i3wm in its entirety, without the need for any configuration, I promise.

Actually, I utilized an enclosure to boot the SSD with Arch inside. Considering that the X270 has a built-in M.2, I simply wanted to let Windows 11 rest in peace without disturbing it. However, eventually, problems arose, and I was forced to set up a dual boot system.

This is roughly what my partition looks like now.
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

It's universal, I can open [WPS](https://wiki.archlinux.org/title/WPS_Office) on workspace 1 and terminal on workspace 4 (for example), sure. This is as random and free as possible configuration that I have. I previously used [polybar](https://github.com/polybar/polybar) as the bar. However, for several reasons, I want to take advantage of [i3wm scratchpad feature](https://i3wm.org/docs/userguide.html#_scratchpad) to use the bar with the [Bash script I write](.local/bin/stat-bar.sh).
