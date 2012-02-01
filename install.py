#!/usr/bin/python

import os


srcpath = os.path.abspath(os.path.dirname(__file__))
dstpath = os.path.abspath(os.path.expanduser("~"))

print "Installing dotfiles from '"+str(srcpath)+"' to '"+str(dstpath)+"':"

dirlist = os.listdir(srcpath)
for f in dirlist:
    if f != '.git' and f != '.gitignore' and f != 'install.py':
        srcfile = os.path.join(srcpath, f)
        dstfile = os.path.join(dstpath, "."+f)
        print "> "+f
        if not os.path.exists(dstfile):
            os.system("ln -s "+srcfile+" "+dstfile)

print "Done."
