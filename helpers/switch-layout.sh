#!/bin/sh

export LAYOUT=$(setxkbmap -query | grep 'layout:' | sed 's/layout:     //g')


if [ $LAYOUT == 'us' ] ; then
  setxkbmap de
else
  setxkbmap us
fi
