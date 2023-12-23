export ZSH="$ZDOTDIR/ohmyzsh"

# oh-my-zsh theme
ZSH_THEME="robbyrussell"

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


# ------------------------------------------------ Fuzzy finder config 
function f() {
  f_result=$(fzf --height 70% --layout=reverse --border --preview 'bat --color=always {}')
  if [ $? -eq 0 ]; then
    vim $f_result
  fi
}
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
bindkey "^A" fzf-history-widget


[[ -s "$ZDOTDIR/.zsh_profile" ]] && source "$ZDOTDIR/.zsh_profile" ]]
