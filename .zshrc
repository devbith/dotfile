# ----------------------------------------------------------------------- Prompt customization with git branch
COLOR_DEF=$'%f'
COLOR_USR=$'%F{235}'
COLOR_DIR=$'%F{81}'
COLOR_GIT=$'%F{34}'
COLOR_GIT_CHANGE=$'%F{214}'

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo -e "${COLOR_GIT_CHANGE}*${COLOR_GIT}"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%~${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

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


# Yank to the system clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | pbcopy -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip


# ------------------------------------------------ Fuzzy finder config 
function f() {
  f_result=$(fzf --height 70% --border --preview 'bat --color=always {}')
  if [ $? -eq 0 ]; then
    vim $f_result
  fi
}

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --border'

bindkey "^O" fzf-history-widget 
bindkey -M vicmd "^O" fzf-history-widget

# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS=" --reverse
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic"


# ------------------------------------------------------------------ 
alias vim="vim"
alias vi="vim"
alias v="vim"
alias l="ls -al"


# ------------------------------------------------------------------ Git config 

 function git_checkout_main() {
   total_branch=$(git branch -l main master | wc -l)
   if [ $total_branch -eq 2 ]
   then; 
     echo "$fg_bold[red]Main branch conflict.$reset_color";
     git ls-remote --symref origin HEAD | grep -o "master\|main" | xargs git checkout
   else
     git checkout main && (exit 0) || (c=$?; git checkout master; (exit $c))
   fi;
 }

alias gs='git status'
alias slog="git log --graph --pretty=format:'%C(auto) %h %cr -%d %s %C(cyan)<%an>' --abbrev-commit -n 15"
alias main="git_checkout_main"

# --------------------------------------------------------- Edit inline command in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# --------------------------------------------------------- Edit inline command in vim with ctrl-e:
bindkey "^ " clear-screen
bindkey -M vicmd "^ " clear-screen
