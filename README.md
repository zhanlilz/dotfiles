# dotfiles

my dotfiles in the home directory for linux

## Installation

1. Clone the repo: 
$ git clone https://github.com/Woodstonelee/dotfiles.git

2. Edit .bash_custom/.program.config.sh to include any configuration
of your own installed programs.
3. (Optional) install powerline-shell prompt

  3.1 Pull the submodules for powerline shell prompt: 

$ cd dotfiles

$ git submodule init

$ git submodule update

  3.2 Install powerline fonts and powerline shell according to the README in these two folders.

## Troubleshooting

* The prompt does not wrap a long line correctly, e.g. a long is
  wrapped around to the beginning of shell prompt.

  Answer: this most likely comes from the incorrect counting of
  lengths of utf-8 characters in the powershell by the terminal type
  your shell is using. You should check your terminal type and locale
  setting via:
  
  $ echo $TERM
  $ echo $LANG

  Currently I have found TERM=xterm and LANG=en_US.UTF-8 will work
  well.
