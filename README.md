
## Clone the repo to desire path & get started

#### 1. Create temporary environment variable `dotfile_path` pointing to cloned repository

- Go to cloned repository path 
- Create temporary environemnt vraible
```
export dotfile_path="$(pwd)"
```

#### 2. Install zsh shell and make it a default
- Install zsh
- Make it default
```
chsh -s $(which zsh)
```

> Note: Restart or logout if needed after making it default. After restart repeat `step 1`

#### 3. Reference dotfile `.zshenv` configuration 

```
rm $HOME/.zshenv;ln -s $dotfile_path/.zshenv $HOME/.zshenv;
```
> Note: Restart the terminal and repeat `step 1`

#### 4. Install utility tools 
> For mac os install `brew` package manger first

- Install fuzzy finder, fd-find, bat, git-delta and tmux 
```
sudo dnf -y install fd-find bat git-delta; 
```
- Install Oh-my-zsh
- Delete and replace .zshrc created by oh-my-zsh 
```
rm $XDG_CONFIG_HOME/zsh/.zshrc; ln -s $dotfile_path/.zshrc $XDG_CONFIG_HOME/zsh/.zshrc;
```
- Copy `.zprofile` from home path and move to `$XDG_CONFIG_HOME/zsh/`
```
cp $HOME/.zprofile $XDG_CONFIG_HOME/zsh/
```
- Map fzf key binding. Source the corresponding file for your shell. 

 In Linux:
```
echo "source /usr/share/fzf/shell/key-bindings.zsh" >> $XDG_CONFIG_HOME/zsh/.zprofile
```
  In Mac:
```
echo "source /opt/homebrew/opt/fzf/shell/key-bindings.zsh" >> $XDG_CONFIG_HOME/zsh/.zprofile
```

- Configure git config folder and link config file;
```
rm $HOME/.gitconfig; rm $HOME/.gitignore; rm -rf $XDG_CONFIG_HOME/git; mkdir -p $XDG_CONFIG_HOME/git;ln -s $dotfile_path/config $XDG_CONFIG_HOME/git/config;ln -s $dotfile_path/ignore $XDG_CONFIG_HOME/git/ignore;
```

- Optional: For mac, add the zsh-completion
https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
Add the following in .zprofile
```
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
f
```

#### 6. Install Vim 
- Reference `vimrc` vim config
```
rm -rf $HOME/.vim/vimrc; mkdir $HOME/.vim/vimrc; ln -s $dotfile_path/init.vim $HOME/.vim/vimrc
```
- Install Vim-Plug neovim plugin manager
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
- Open Neovim and install plugin with `:PluginInstall`


#### 7. Install Tmux 

- Configure tmux config folder and link tmux file
```
rm $HOME/.tmux.conf; rm -rf $XDG_CONFIG_HOME/tmux; mkdir -p $XDG_CONFIG_HOME/tmux/; ln -s $dotfile_path/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf;
```
- Configure tmux plugin manager `tpm`
```
mkdir $XDG_CONFIG_HOME/tmux/plugins; git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```
- Source the terminal and install tmux plugins
```
tmux source $XDG_CONFIG_HOME/tmux/tmux.conf; 
```

 Press tmux prefix + I (capital i, as in Install) to fetch the plugin.

- Install tmux-yank plugin ( Go through the README.md of https://github.com/tmux-plugins/tmux-yank)
#### Other

#### Install <a href="https://sdkman.io/install"> SDKMAN </a>
```
export SDKMAN_DIR="$XDG_DATA_HOME/sdkman" && curl -s "https://get.sdkman.io" | bash; echo 'export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"' >> $XDG_CONFIG_HOME/zsh/.zprofile
```


#### Install `ruby`
- Follow the last instruction put the system variable in  `~/.zprofile`
 
#### Install `glow`
 https://github.com/charmbracelet/glow

#### Install `slides`
 https://github.com/maaslalani/slides

#### Install `zsh-syntax-highlighting `
 https://formulae.brew.sh/formula/zsh-syntax-highlighting

### Git aliass 
```
alias.pushup=!git pull --rebase && git push
alias.staash=stash --all
alias.rebase-main=!git checkout main && git pull && git checkout - && git rebase main
```
