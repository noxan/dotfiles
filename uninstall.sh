#!/bin/sh

function uninstallConfig {
  rm -rf "$HOME/.$1"
}
# vim
uninstallConfig 'vim'
uninstallConfig 'vimrc'
# git
uninstallConfig 'gitconfig'
# i3
uninstallConfig 'i3/'
uninstallConfig 'i3status.conf'
# Xorg
uninstallConfig 'xinitrc'
uninstallConfig 'Xmodmap'
uninstallConfig 'Xresources'
# python
uninstallConfig 'pydistutils.cfg'
# gtk
uninstallConfig 'gtkrc-2.0'
