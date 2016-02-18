# dotfiles

my dotfiles in the home directory for linux

## installation

1. Clone the repo: 
$ git clone https://github.com/Woodstonelee/dotfiles.git
2. Edit .bash_custom/.program.config.sh to include any configuration
of your own installed programs.
3. (Optional) install powerline-shell prompt
  3.1 Pull the submodules for powerline shell prompt: 
$ cd .bash_custom/powerline-shell
$ git submodule init
$ git submodule update
$ cd .bash_custom/powerline-fonts
$ git submodule init
$ git submodule update 

  3.2 Install powerline fonts and powerline shell according to the README in these two folders.
