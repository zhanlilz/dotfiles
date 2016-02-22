#!/bin/bash

# make a folder to backup all the old dotfiles before copying new
# ones.
if [[ ! -d $HOME/dotfiles-bak ]]; then
    mkdir -p $HOME/dotfiles-bak
fi

if [[ -e $HOME/.bashrc ]]; then
    cp $HOME/.bashrc $HOME/dotfiles-bak/
    echo "backuped the old .bashrc"
fi
cp .bashrc $HOME/
echo "copied .bashrc"

if [[ -e $HOME/.bash_aliases ]]; then
    cp $HOME/.bash_aliases $HOME/dotfiles-bak/
    echo "backuped the old .bash_aliases"
fi
cp .bash_aliases $HOME/
echo "copied .bash_aliases"

if [[ -e $HOME/.profile ]]; then
    cp $HOME/.profile $HOME/dotfiles-bak/
    echo "backuped the old .profile"
fi
if [[ -e $HOME/.bash_profile ]]; then
    mv $HOME/.bash_profile $HOME/dotfiles-bak/
    echo "backuped the old .bash_profile"
fi
if [[ -e $HOME/.bash_login ]]; then
    mv $HOME/.bash_login $HOME/dotfiles-bak/
    echo "backuped the old .bash_login"
fi
cp .profile $HOME/
echo "copied .profile"

if [[ -d $HOME/.bash_custom || -e $HOME/.bash_custom ]]; then
    cp -r $HOME/.bash_custom $HOME/dotfiles-bak/
    echo "backuped the old .bash_custom"
fi
cp -r .bash_custom $HOME/
echo "copied .bash_custom folder"

if [[ -d $HOME/.emacs.d ]]; then
    cp -r $HOME/.emacs.d $HOME/dotfiles-bak/
    echo "backuped the old .emacs.d"
    cp -r .emacs.d $HOME/
    echo "copied .emacs.d folder"
fi