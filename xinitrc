#!/bin/sh

xrdb -merge .Xresources

setxkbmap de

exec ssh-agent /usr/bin/i3 --force-xinerama

