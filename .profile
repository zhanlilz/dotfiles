# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or
# ~/.bash_login exists.  see
# /usr/share/doc/bash/examples/startup-files for examples.  the files
# are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set environment variables for programs installed using the home
# directory scheme and a separate and individual directories under the
# folder ~/Programs.
# 
# !!! This is better to be put in this .profile rather than .bashrc
# !!! because the grid scheduler such as qsh or qsub will re-source
# !!! .bashrc again but will not do .profile when you add -V to 
# !!! inherit the environmental variables. If .bashrc is re-sourced
# !!! again and the following is in it, the sequence of directories 
# !!! in the PATH could be messed up. 
if [ -f "$HOME/.bash_custom/.programs.config.sh" ] ; then
    . "$HOME/.bash_custom/.programs.config.sh"
fi

# set some environmental variables for bash
# export EDITOR="emacsclient -nw --alternate-editor="" -c"
export EDITOR="vi"
