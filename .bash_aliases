# ~/.bash_aliases
# User specific aliases and functions

alias rm='rm -i'
alias emacs='emacsclient -nw --alternate-editor="" -c'

function ssh()
{
  n=${#}
  case ${@: -1} in
    "neponset")
      command ssh ${@:1:$((n-1))} zhan.li@neponset.eeos.umb.edu
      ;;
    "mystic")
      command ssh ${@:1:$((n-1))} zhan.li@mystic.eeos.umb.edu
      ;;
    "charles")
      command ssh ${@:1:$((n-1))} zhan.li@charles.umb.edu
      ;;
    "ghpcc06")
      command ssh ${@:1:$((n-1))} zl69b@ghpcc06.umassrc.org
      ;;
    *)
      command ssh "$@"
      ;;
  esac
}
