#!/bin/bash 

# PATH where dotfiles is cloned

dotfiles_bin_root=$(cd $(dirname $0); pwd)
dotfiles_root=${dotfiles_bin_root%/.bin}

## apt update

sudo apt update -y
sudo apt upgrade -y

## install required things

sudo apt install -y clang

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

export pyenv_root="${dotfiles_root}/.python/.pyenv"

if [ ! -e ${pyenv_root} ]; then
    sudo apt install -y build-essential
    sudo apt install -y libffi-dev
    sudo apt install -y libssl-dev
    sudo apt install -y zlib1g-dev
    sudo apt install -y liblzma-dev
    sudo apt install -y libbz2-dev libreadline-dev libsqlite3-dev

    git clone https://github.com/pyenv/pyenv.git ${pyenv_root}
    git clone https://github.com/pyenv/pyenv-virtualenv.git ${pyenv_root}/plugins/pyenv-virtualenv
    git clone https://github.com/pyenv/pyenv-update.git ${pyenv_root}/plugins/pyenv-update
fi

## neovim

sudo apt install -y neovim

## rbenv

export rbenv_root="${dotfiles_root}/.ruby/.rbenv"

if [ ! -e ${rbenv_root} ]; then
    git clone https://github.com/rbenv/rbenv.git ${rbenv_root}
    git clone https://github.com/rbenv/ruby-build.git ${rbenv_root}/plugins/ruby-build
fi

## apt autoremove

sudo apt autoremove -y

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

zsh
