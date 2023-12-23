# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/ohmyzsh"

ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# HIST_STAMPS="mm/dd/yyyy"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ----------------------------------------------------------------------- Prompt customization
PROMPT='%{$fg[white]%}%~%{$reset_color%}$(git_prompt_info)'
PROMPT+=" %(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ )%{$reset_color%}"

# -------------------------------------------------------------- Git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[075]}(${FG[078]}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# ------------------------------------------------ Vim mode terminal (GNU ReadLine Editor) & Cursor Config
bindkey -v
export KEYTIMEOUT=1

zle-keymap-select () {
  if [ $KEYMAP = vicmd ]; then
      printf "\033[2 q" # Block Cursor in CMD mode
  else
      printf "\033[6 q" # Line Cursor in Insert mode
  fi
}
zle -N zle-keymap-select

zle-line-init () {
  zle -K viins
  printf "\033[6 q"
}
zle -N zle-line-init
