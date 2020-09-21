# ~/.bash_aliases
# User specific aliases and functions

alias rm='rm -i'
# alias emacs='emacsclient -nw --alternate-editor="" -c'
# alias matlab_cmd='matlab -nojvm -nodisplay -nosplash'

# alias start-gra-vdi='vncviewer -CompressLevel 6 -QualityLevel 6 gra-vdi.computecanada.ca -via zhanli@graham.computecanada.ca'

# The following function will automatically sync any files in a subdirectory called 'scripts' to given multiple servers.
# 
# In this way, I can create/edit scripts on my local computer and sync simultaneously to multiple servers to maintain
# consistency of scripts between multiple servers. 
# 
# When using this function, ONLY create/edit scripts on local computer and let it sync to servers. 
# Anything created in the subdirectories 'scripts' on servers but not on the local computer will be automatically deleted! 
# 
# Before starting `zhan-start-work`, install inotify-tools on the local computer. 
function zhan-start-work () {
    # Kill existing inotifywait
    cur_events=$(ps -u $(whoami) -A | grep inotifywait)
    if [[ ! -z ${cur_events} ]]; then
        echo "You have the following running inotifywait events."
        ps -u $(whoami) -A | grep inotifywait
        
        echo "Would you like to terminate them before start this new one? (Y/n)"
        read YN
        if [[ "${YN}" == "Y" ]]; then
            # to kill
            echo "Killing the existing inotifyevent"
            pkill inotifywait
        fi
    fi
    local rsync_opts=${@}
    local root_dir="/my/projects-scripting/dir/on/local"
    while inotifywait -r -e modify,create,delete,move \
        --exclude "\..*\.(swp|swx)" \
        --exclude ".*\.ipynb" \
        ${root_dir}; do
       rsync ${@} -rltvP \
           --perms --chmod=ugo+r,Dug+w,Duo+x,Dg+s,Fug+w,Fugo-x \
           --delete -m \
           --filter '- runtime/' \
           --filter '- .ipynb_checkpoints/' \
           --filter '- .*' \
           --filter '- *.ipynb' \
           --filter '+,s */' \
           --filter '+ scripts/**' \
           --filter '- *' \
           ${root_dir}/ server1:/my/projects/dir/on/remote1
       rsync ${@} -rltvP \
           --perms --chmod=ugo+r,Dug+w,Duo+x,Dg+s,Fug+w,Fugo-x \
           --delete -m \
           --filter '- runtime/' \
           --filter '- .ipynb_checkpoints/' \
           --filter '- .*' \
           --filter '- *.ipynb' \
           --filter '+,s */' \
           --filter '+ scripts/**' \
           --filter '- *' \
           ${root_dir}/ server2:/my/projects/dir/on/remote2
    done
}
alias zhan-start-work='zhan-start-work'
