# dotfile

### Clone the repo to desire location:

Checkout cloned repo

$ cd dotfiles

Create a temporary environment variable pointing to dotfiles folder

$ export dotfile_path="$(pwd)"

## Install zsh shell and make it a defautl zshell

### Reference the `.zshenv` configuration

ln -s $dotfile_path/.zshenv $HOME/.zshenv;
