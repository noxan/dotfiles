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

function installConfig {
  SOURCE="$DOTFILES/$1"
  TARGET="$HOME/.${1%/}"
  if [ ! -L "$TARGET" ]; then
    ln -s $SOURCE $TARGET
  fi
}

# vim
installConfig 'vim/'
installConfig 'vimrc'
# git
installConfig 'gitconfig'
# i3
installConfig 'i3/'
installConfig 'i3status.conf'
