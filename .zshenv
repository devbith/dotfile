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
alias vim="nvim"
alias v="nvim"

# ------------------------------------------------ Git config 

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
