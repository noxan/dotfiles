#!/bin/sh

echo "Clone dotfiles."
git clone git@github.com:noxan/dotfiles $HOME/.dotfiles

echo "Init submodules."
(cd $HOME/.dotfiles && git submodule update --init)

for i in $(ls -d $HOME/.dotfiles/dotfiles/*); do
  echo "Link ${i} to $HOME/.$(basename ${i}).";
  ln -s ${i} "$HOME/.$(basename ${i})";
done

echo "Done."
