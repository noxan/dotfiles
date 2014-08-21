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
  SOURCE="$DOTFILES/$1/$2"
  TARGET="$HOME/.${2%/}"
  echo "$SOURCE -> $TARGET"
  if [ ! -L "$TARGET" ]; then
    ln -s $SOURCE $TARGET
  fi
}

# zsh
installConfig 'zsh' 'zshrc'
# vim
installConfig 'vim' 'vim/'
installConfig 'vim' 'vimrc'
# git
installConfig 'git' 'gitconfig'
# i3
installConfig 'i3' 'i3/'
installConfig 'i3' 'i3status.conf'
# Xorg
installConfig 'X' 'xinitrc'
installConfig 'X' 'Xmodmap'
installConfig 'X' 'Xresources'
# python
installConfig 'python' 'pydistutils.cfg'
# gtk
installConfig 'gtk' 'gtkrc-2.0'
