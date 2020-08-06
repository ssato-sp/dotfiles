#!/bin/zsh

pyenv install 3.8.2
pyenv virtualenv 3.8.2 python3_neovim
pyenv global python3_neovim
pip install --upgrade pip
pip install pynvim
pip install flake8
pyenv global 3.8.2
