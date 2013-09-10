#!/bin/sh

cd ~

xrdb -merge .Xresources

setxkbmap us

exec ssh-agent /usr/bin/i3 --force-xinerama

