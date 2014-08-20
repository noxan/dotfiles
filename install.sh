#!/bin/sh

set -e

if [ ! -n "$DOTFILES" ]; then
  DOTFILES="$HOME/.dotfiles"
fi

if [ -d "$DOTFILES" ]; then
  echo "You have already dotfiles already installed. Remove the directory if you want to install it again."
  exit
else
  git clone git@github.com:noxan/dotfiles $DOTFILES
fi

(cd $DOTFILES && git submodule init)
(cd $DOTFILES && git submodule update)

# vim
ln -s "$DOTFILES/vim/vim/" ~/.vim
ln -s "$DOTFILES/vim/vimrc" ~/.vimrc
# git
ln -s "$DOTFILES/git/gitconfig" ~/.gitconfig
# i3
ln -s "$DOTFILES/i3/i3/" ~/.i3
ln -s "$DOTFILES/i3/i3status.conf" ~/.i3status.conf
