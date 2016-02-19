#!/bin/bash
cp .bashrc $HOME/
echo "copied .bashrc"

cp .bash_aliases $HOME/
echo "copied .bash_aliases"

cp .profile $HOME/
echo "copied .profile"

cp -r .bash_custom $HOME/
echo "copied .bash_custom folder"

cp -r .emacs.d $HOME/
echo "copied .emacs.d folder"