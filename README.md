
### Clone the repo to desire path & get started

### 1. Create temporary environment variable `dotfile_path` pointing to cloned repository

- Go to cloned repository path 
- Create temporary environemnt vraible
```
export dotfile_path="$(pwd)"
```

### 2. Install zsh shell and make it a default
- Install zsh
- Make it default
```
chsh -s $(which zsh
```

> Note: May be restart or logout is needed after making it default. After restart repeat `step 1`

### 3. Reference dotfile `.zshenv` configuration 

```
rm $HOME/.zshenv;ln -s $dotfile_path/.zshenv $HOME/.zshenv;
```
> Note: Restart the terminal and repeat `step 1`

### 4. Install Fuzzy finder and Bat

In Fedora:
```
sudo dnf install fzf; sudo dnf install bat;
```
### 5. Install oh-my-zsh

After installing oh-my-zsh:

Delete and replace .zshrc created by oh-my-zsh 
```
rm $XDG_CONFIG_HOME/zsh/.zshrc; ln -s $dotfile_path/.zshrc $XDG_CONFIG_HOME/zsh/.zshrc;
```

### 6. Install Neovim 
- Install Neovim
- Reference `init.vim` neovim config
```
rm -rf $XDG_CONFIG_HOME/nvim; mkdir $XDG_CONFIG_HOME/nvim; ln -s $dotfile_path/init.vim $XDG_CONFIG_HOME/nvim/init.vim
```
- Install Vim-Plug neovim plugin manager
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
- Open Neovim and install plugin with `:PluginInstall`



