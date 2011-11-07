#!/usr/bin/python

import os


srcpath = os.path.abspath(os.path.dirname(__file__))
dstpath = os.path.abspath(os.path.expanduser("~"))

print "Installing dotfiles from "+str(srcpath)+" to "+str(dstpath)+" ..."

dirlist = os.listdir(srcpath)
for f in dirlist:
    if f != '.git' and f != '.gitignore' and f != 'install.py':
        if os.path.isdir(f):
            os.system("cp "+os.path.join(srcpath, f)+" "+os.path.join(dstpath, f)+" -r")
            print "Copying directory "+f+" ..."
        else:
            os.system("cp "+os.path.join(srcpath, f)+" "+os.path.join(dstpath, f))
            print "Copying file "+f+" ..."
