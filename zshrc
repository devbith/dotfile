# ---------------------------------------------- OH-MY-ZSH  
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="mortalscumbag"
plugins=(git)
source $ZSH/oh-my-zsh.sh


# ---------------------------------------------- XDG paths
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# ---------------------------------------------- ZSH shell default folder 
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"                  

# ---------------------------------------------- Zsh history config
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
export HISTFILE="$ZDOTDIR/.zsh_history"
# export HISTTIMEFORMAT="[%F %T] "
export PROMPT_COMMAND="history -a; history -n"

setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY     # Immediately save command to history file
setopt SHARE_HISTORY   	      # Share history between session


# ------------------------------------------------ task tool - https://taskwarrior.org/docs/configuration/  
export TASKRC=~/devbith/dotfile/task/config/taskrc 
export TASKDATA=~/devbith/dotfile/task/data

# ------------------------------------------------ vim config and alias
export EDITOR=nvim

# ------------------------------------------------ Returns the path of the terminal device 
export GPG_TTY=$(tty)
export PINENTRY_USER_DATA="USE_CURSES=1"
export CLICOLOR=1
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

bindkey "^O" fzf-history-widget 
bindkey -M vicmd "^O" fzf-history-widget

function tmxs() {
	tmux-sessionizer
}

zle -N tmxs
bindkey "^f" tmxs
bindkey -M vicmd "^f" tmxs

# ------------------------------------------------ Fuzzy finder config 
function ff() {
  f_result=$(fzf --height 70% --border --preview 'bat --color=always {}')
  if [ $? -eq 0 ]; then
    nvim $f_result
  fi
}

source <(fzf --zsh)

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix '
export FZF_DEFAULT_OPTS='
  --height 40% --layout reverse --border top
	--color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border="sharp" --border-label="" --preview-window="border-thinblock" --prompt="> "
  --marker=">" --pointer=">" --separator="─" --scrollbar="│"
  --info="right"'



# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS=" --reverse
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic"


# ------------------------------------------------------------------ 
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias l='ls -a --color=auto'
alias ls="ls -T --color=auto"
alias ll="ls -lTh --color=auto"
alias lla="ls -alTh --color=auto"
alias sdock="lazydocker"
alias active_autocomplete_kubectl="source <(kubectl completion zsh)"
alias active_autocomplete_aws-vault='eval "$(aws-vault --completion-script-zsh)"'
alias active_autocomplete_podman='evaul "$(podman completion zsh"'

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
alias slog="git log --graph --pretty=format:'%C(auto) %h %cr -%d %s %C(cyan)<%an>' --abbrev-commit -n 30"
alias main="git_checkout_main"

# --------------------------------------------------------- Edit inline command in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


bindkey "^ " clear-screen
bindkey -M vicmd "^ " clear-screen

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}



[ -f ~/.config/zsh/.zprofile ] && source ~/.config/zsh/.zprofile

# [ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh
# source /home/bishal/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /home/bishal/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
