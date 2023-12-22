
### 1. Clone the repo to desire path

Checkout cloned repo
```
$ cd dotfiles
```

Create a temporary environment variable `dotfile_path` pointing to cloned repository

```
$ export dotfile_path="$(pwd)"
```

## 2. Install zsh shell and make it a default
- Install zsh
- Make it default
```
$ chsh -s $(which zsh
```

> Note: May be restart or logout is needed after making it default

## 3. Reference dotfile `.zshenv` configuration

```
$ rm $HOME/.zshenv;ln -s $dotfile_path/.zshenv $HOME/.zshenv;
```

## 4. Install oh-my-zsh

After installing oh-my-zsh:

Delete and replace .zshrc created by oh-my-zsh 
```
$ rm $XDG_CONFIG_HOME/zsh/.zshrc; ln -s $dotfile_path/.zshrc $XDG_CONFIG_HOME/zsh/.zshrc;
```

## 5. Install Neovim

