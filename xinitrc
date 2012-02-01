#!/bin/sh

xrdb -merge .Xresources

exec ssh-agent /usr/bin/i3 --force-xinerama

