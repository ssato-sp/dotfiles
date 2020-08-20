# dotfiles

## NOTE

- Please REWRITE DOTFILES\_ROOT at .zshrc and g:python3\_host\_prog at .config/nvim/init.vim
  - Change according to the directory where dotfiles is cloned
  - Default is ~ ($HOME)

## required

- git

## install

- zsh
  - peco
- tmux
- pyenv
  - pyenv-virtualenv
  - pyenv-update
- neovim
- rbenv

`~/this_dotfiles/.bin/install_*.sh`

then

`~/this_dotfiles/.bin/make_pyenv_neovim_ubuntu.sh`

then

`~/this_dotfiles/.bin/make_rbenv_ubuntu.sh`

## uninstall

`~/this_dotfiles/.bin/uninstall_*.sh`

Then, remove dotfiles directory.

## optional

- install guake terminal

`sudo apt install guake`
