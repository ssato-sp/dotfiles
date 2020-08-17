#!/bin/zsh

pyenv install 3.8.2
pyenv virtualenv 3.8.2 python3_neovim
pyenv global python3_neovim
pip install --upgrade pip
pip install -U pynvim
pip install -U flake8
pip install -U flake8-import-order
pip install -U autopep8
pip install -U black
pip install -U isort
pyenv global 3.8.2
