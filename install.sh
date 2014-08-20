#!/bin/sh

set -e

if [ ! -n "$DOTFILES" ]; then
  DOTFILES="$HOME/.dotfiles"
fi


git clone git@github.com:noxan/dotfiles $DOTFILES

cd $DOTFILES

git submodule init
git submodule update

# vim
ln -s "$DOTFILES/vim/vim/" ~/.vim
ln -s "$DOTFILES/vim/vimrc" ~/.vimrc
# i3
ln -s "$DOTFILES/i3/i3/" ~/.i3
ln -s "$DOTFILES/i3/i3status.conf" ~/.i3status.conf
