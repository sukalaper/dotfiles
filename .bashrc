#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
PS1='\u@ThinkpadX270:\w\$ '

# Auto completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Completion Case-Insensitive in Bash
bind 'set completion-ignore-case on'

# Some Alias
alias ls='exa --icons=always'
alias pcs='sudo pacman -S'
alias pcsyu='sudo pacman -Syu'
alias remove='sudo pacman -Rncs'
alias compile='time g++'
alias lampp='if ! sudo /opt/lampp/lampp status | grep "already running"; then sudo /opt/lampp/lampp start; fi'
alias lamppstop='if ! sudo /opt/lampp/lampp status | grep "already running"; then sudo /opt/lampp/lampp stop; fi'
