# ~/.bashrc

# ⛔ Exit if not interactive shell
[[ $- != *i* ]] && return

# 🧑‍💻 Prompt sederhana
PS1='\u:\w\$ '

# 🎨 Pywal (jalankan hanya jika ada display)
if [ -n "$DISPLAY" ]; then
  [ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences
  wal -R >/dev/null
fi

# 🧹 Optional: clear terminal saat shell dimulai (bisa dikomentari kalau mengganggu)
[[ $- == *i* ]] && clear

# 🧠 Auto completion
if ! shopt -oq posix; then
  . /usr/share/bash-completion/bash_completion 2>/dev/null ||
  . /etc/bash_completion.d/000_bash_completion_compat.bash 2>/dev/null
fi

# 🔧 Shell tweaks
shopt -s cdspell
bind 'set completion-ignore-case on'

# 🎨 BAT theme
export BAT_THEME="gruvbox-dark"

# 📁 Fungsi fcd: buka folder/file pakai fzf + bat + vim
fcd() {
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

# 📂 CDPATH: bisa cd ke ~/.config/nvim dari mana pun
CDPATH="${CDPATH:+$CDPATH:}$HOME/.config:$HOME"
export CDPATH

# 🚀 PATH: jalankan script dari ~/.local/bin secara global
export PATH="$HOME/.local/bin:$PATH"

# 🔖 Alias umum
alias ls='exa --inode --header --icons=always'
alias pcs='sudo pacman -S'
alias pcsyu='sudo pacman -Syu'
alias remove='sudo pacman -Rncs'
alias compile='time g++'
alias wtc='watch -n 5 -t -d ~/.local/bin/stat-bar'
alias lampp='if ! sudo /opt/lampp/lampp status | grep "already running"; then sudo /opt/lampp/lampp start; fi'
alias lamppstop='if ! sudo /opt/lampp/lampp status | grep "already running"; then sudo /opt/lampp/lampp stop; fi'
alias copas='xclip -selection clipboard'
alias rel='source ~/.bashrc'
alias gc='git clone'
alias c='clear'
alias cpcmn='sudo pacman -Scc --noconfirm'
alias ..='cd ..'
alias pcmndate="awk '/\[ALPM\] installed/ { print \$(NF-1) }' /var/log/pacman.log"
alias chrgr="cat /sys/class/power_supply/BAT0/status 2>/dev/null"

# 🧹 Bersihkan paket yatim, log lama, cache, dll
cleanup() {
  sudo journalctl --vacuum-time=7d

  local orphans
  orphans=$(pacman -Qdtq)
  if [ -n "$orphans" ]; then
    sudo pacman -Rns --noconfirm $orphans
  else
    echo "No orphans to remove."
  fi

  sudo pacman -Sc --noconfirm
  sudo rm -f /var/cache/pacman/pkg/download-* 2>/dev/null
  yay -Sc --noconfirm
}

# 🧹 Hapus orphan package (dipanggil manual)
orphans() {
  local o=$(pacman -Qdtq)
  [ -n "$o" ] && sudo pacman -Rns $o || echo "No orphans found."
}
