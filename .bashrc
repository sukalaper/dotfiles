# ~/.bashrc

# If not running interactively, don't do anything
  [[ $- != *i* ]] && return

# Nice username
  PS1='\u@ThinkPad:\w\$ '

# Pywal
  cat ~/.cache/wal/sequences >/dev/null
  wal -R >/dev/null

# Used to remove output from " xrdb can't open display '' "
  clear
  
# Auto completion
  if ! shopt -oq posix; then
    . /usr/share/bash-completion/bash_completion || 
    . /etc/bash_completion.d/000_bash_completion_compat.bash
  fi

  shopt -s cdspell

  bind 'set completion-ignore-case on'

  export BAT_THEME="gruvbox-dark"
 
  function fcd() {
    local result
    result=$(find . \( -type d -o -type f \) | fzf --preview 'bat --color=always {}')
    if [ -n "$result" ]; then
      if [ -d "$result" ]; then
        cd "$result"  
      else
        vim "$result"  
      fi
    fi
  }

# CDPATH configuration
  CDPATH=$CDPATH:~/.config
  export CDPATH
  export PATH="$HOME/.local/bin:$PATH"

# Some Alias
  alias ls='exa --inode --header --icons=always'
  alias pcs='sudo pacman -S'
  alias pcsyu='sudo pacman -Syu'
  alias remove='sudo pacman -Rncs'
  alias compile='time g++'
  alias wtc='watch -n 5 -t -d ~/.local/bin/stat-bar'
  alias lampp='if ! sudo /opt/lampp/lampp status | grep "already running"; then sudo /opt/lampp/lampp start; fi'
  alias lamppstop='if ! sudo /opt/lampp/lampp status | grep "already running"; then sudo /opt/lampp/lampp stop; fi'
  alias copas='xclip -selection clipboard'
  alias rel='source .bashrc'
  alias gc='git clone'
  alias c='clear'
  alias cpcmn='sudo pacman -Scc --noconfirm'
  alias ..='cd ..'
