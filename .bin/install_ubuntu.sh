#!/bin/bash 

# Path (Where dotfiles is copied)

# if [ $# -ne 1 ]; then
#   echo "ERROR     : The number of arguments is not 1." 1>&2
#   echo "HOW TO USE: .install.sh <PATH/TO/WHERE/YOU/CLONE/DOTFILES>" 1>&2
#   exit 1
# fi

dotfiles_bin_root=$(cd $(dirname $0); pwd)
dotfiles_root=${dotfiles_bin_root%/.bin}

## apt update

sudo apt update -y

## install zsh

sudo apt install -y zsh

if [ $(echo $SHELL) !=  "zsh"]; then
    chsh -s $(which zsh)
fi

ln -s ~/dotfiles/.zshrc ~/.zshrc

### install peco

sudo apt install -y peco

## install tmux

sudo apt install -y tmux
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

## python pyenv virtualenv (for neovim)

export pyenv_root="${dotfiles_root}/.python_venv/.pyenv"

if [ ! -e ${pyenv_root} ]; then
    sudo apt install -y build-essential
    sudo apt install -y libffi-dev
    sudo apt install -y libssl-dev
    sudo apt install -y zlib1g-dev
    sudo apt install -y liblzma-dev
    sudo apt install -y libbz2-dev libreadline-dev libsqlite3-dev
    
    git clone https://github.com/pyenv/pyenv.git ${pyenv_root}
    git clone https://github.com/pyenv/pyenv-virtualenv.git ${pyenv_root}/plugins/pyenv-virtualenv
    git clone git://github.com/yyuu/pyenv-update.git ${pyenv_root}/plugins/pyenv-update
    eval "(${pyenv_root}/bin/pyenv init -)"
    eval "(${pyenv_root}/bin/pyenv virtualenv-init -)"
    eval "(${pyenv_root}/bin/pyenv install 3.8.2)"
    eval "(${pyenv_root}/bin/pyenv virtualenv 3.8.2 python3_neovim)"
    eval "(${pyenv_root}/bin/pyenv global python3_neovim)"
    eval "(${pyenv_root}/versions/python3_neovim/bin/pip install --upgrade pip)"
    eval "(${pyenv_root}/versions/python3_neovim/bin/pip install pynvim)"
    eval "(${pyenv_root}/bin/pyenv global 3.8.2)"
fi

## neovim

sudo apt install -y neovim

## apt upgrade

sudo apt upgrade -y

# auto rewrite envorinment variable (rmeove comment out (#) if you use)

# if [ $(echo $SHELL) !=  "zsh"]; then
#    sed -i "1iexport DOTFILES_ROOT="${dotfiles_root}" " ${dotfiles_root}/.zshrc
# fi

#if [ ! -e ${pyenv_root} ]; then
#    sed -i "1ilet g:python3_host_prog = expand(\"${pyenv_root}/versions/python3_neovim/bin/python\")" ${dotfiles_root}/.config/nvim/init.vim
#fi

echo "Please check DOTFILES_ROOT at .zshrc and g:python3_host_prog at .config/nvim/init.vim"
echo "DOTFILES=${dotfiles_root}"
echo "g:python3_host_prog=${pyenv_root}/versions/python3_neovim/bin/python"
