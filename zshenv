export dotfile_path="$HOME/devbith/dotfile"
export PATH="$PATH:$dotfile_path/bin"

# ---------------------------------------------- XDG paths
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# ---------------------------------------------- ZSH shell default folder 
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"                  
export TERM=xterm-256color

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
setopt INC_APPEND_HISTORY     # Immediately save command to history file
setopt SHARE_HISTORY
setopt auto_cd


# ------------------------------------------------ vim config and alias
export EDITOR="nvim"
QUICKNOTE_FORMAT="%Y-%m-%d"
# Change the quicknote format to get rid of the word "quicknote"
QUICKNOTE_FORMAT="%Y-%m-%d"
# Set extension to plain txt instead of markdown
NOTES_EXT="md"
# Define the directory where notes are stored
NOTES_DIRECTORY=~/devbith/notes


# ------------------------------------------------ Returns the path of the terminal device 
export GPG_TTY=$(tty)
export CLICOLOR=1

export PROMPT_COMMAND="history -a; history -n"

#-----------------------------------------------




