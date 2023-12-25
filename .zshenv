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

# ------------------------------------------------ Neovim config and alias
export EDITOR="nvim"
