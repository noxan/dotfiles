#!/bin/sh

set -e

if [ ! -n "$DOTFILES" ]; then
  DOTFILES=~/.dotfiles
fi


# vim
ln -s "$DOTFILES/vim/vim/" ~/.vim
ln -s "$DOTFILES/vim/vimrc" ~/.vimrc
# i3
ln -s "$DOTFILES/i3/i3/" ~/.i3
ln -s "$DOTFILES/i3/i3status.conf" ~/.i3status.conf
