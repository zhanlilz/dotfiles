# ~/.bash_aliases
# User specific aliases and functions

alias rm='rm -i'
alias emacs='emacsclient -nw --alternate-editor="" -c'

function ssh()
{
  case "$@" in
    "neponset")
      command ssh -AY zhan.li@neponset.eeos.umb.edu
      ;;
    "mystic")
      command ssh -AY zhan.li@mystic.eeos.umb.edu
      ;;
    "charles")
      command ssh -AY zhan.li@charles.umb.edu
      ;;
    "ghpcc06")
      command ssh -AY zl69b@ghpcc06.umassrc.org
      ;;
    *)
      command ssh "$@"
      ;;
  esac
}
