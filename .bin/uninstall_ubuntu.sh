#!/bin/bash

# Path (Where dotfiles is copied)    
    
dotfiles_bin_root=$(cd $(dirname $0); pwd)
dotfiles_root=${dotfiles_bin_root%/.bin}

## uninstall zsh

chsh -s $(which bash)
unlink ~/.zshrc

## uninstall peco

sudo apt remove -y peco

## uninstall tmux

sudo apt remove -y tmux
unlink ~/.tmux.conf

## unisntall pyenv

sudo apt remove -y build-essential
sudo apt remove -y libffi-dev    
sudo apt remove -y libssl-dev    
sudo apt remove -y zlib1g-dev    
sudo apt remove -y liblzma-dev    
sudo apt remove -y libbz2-dev libreadline-dev libsqlite3-dev

sudo rm -rf "${dotfiles_root}/.python/.pyenv"

## uninstall neovim

sudo apt remove -y neovim

## uninstall rbenv

sudo rm -rf "${dotfiles_root}/.ruby/.rbenv"

## uninstall required things

sudo apt remove -y clang

## uninstall remaining file

sudo apt autoremove -y

echo "Please uninstall zsh yourself"
echo ">sudo apt remove zsh"
