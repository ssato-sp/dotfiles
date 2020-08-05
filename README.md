# dotfiles

# NOTE

- Please REWRITE DOTFILES\_ROOT at .zshrc and g:python3\_host\_prog at .config/nvim/init.vim
DOTFILES=/home/ssato/dotfiles
  - Change according to the directory where dotfiles is cloned
  - Default is ~ ($HOME)

## required

- git

## install

- zsh
  - peco
- tmux
- neovim
  - pyenv
  - pyenv-virtualenv

`~/this_dotfiles/.bin/install_*.sh`

## uninstall

`~/this_dotfiles/.bin/uninstall_*.sh`

Then, remove dotfiles directory.

## optional

- install guake terminal

`sudo apt install guake`
