#!/usr/bin/python

import os


srcpath = os.path.abspath(os.path.dirname(__file__))
dstpath = os.path.abspath(os.path.expanduser("~"))

print "Installing dotfiles from "+str(srcpath)+" to "+str(dstpath)+" ..."
