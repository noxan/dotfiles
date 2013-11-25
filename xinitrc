#!/bin/sh

cd ~

xrdb -merge .Xresources
xmodmap ~/.Xmodmap

setxkbmap us

exec ssh-agent /usr/bin/i3
