#!/bin/sh

cd ~

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap

xset b off

setxkbmap us

exec ssh-agent /usr/bin/i3
