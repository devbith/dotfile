export ZSH="$ZDOTDIR/ohmyzsh"

# oh-my-zsh theme
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable auto-setting terminal title. 
DISABLE_AUTO_TITLE="true"
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git docker docker-compose kubectl minikube argocd pass vault zsh-syntax-highlighting microk8s)
# compdef microk8s.kubectl=kubectl
# compdef mk=kubectl

# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# ----------------------------------------------------------------------- Prompt customization
PROMPT='%{$fg[cyan]%}%m: %{$fg[white]%}%~%{$reset_color%}$(git_prompt_info)'
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

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --border'

bindkey "^A" fzf-history-widget
bindkey -M vicmd "^A" fzf-history-widget


# ------------------------------------------------------------------ Editor alias 
alias vim="vim"
alias vi="vim"
alias v="vim"


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
