# ---------------------------------------------- XDG paths
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# ---------------------------------------------- ZSH shell default folder 
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"                  

# ---------------------------------------------- Zsh history config
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTTIMEFORMAT="[%F %T] "

setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.


# ------------------------------------------------ Neovim config and alias
export EDITOR="vim"

# ------------------------------------------------ Returns the path of the terminal device 
export GPG_TTY=$(tty)

export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
