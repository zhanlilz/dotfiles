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
        local root_dir="/my/projects-scripting/dir/on/local"
        while inotifywait -r -e modify,create,delete,move \
                --exclude '.*/runtime' \
                ${root_dir}; do
           rsync -rltvP \
                   --perms --chmod=ugo+r,Dug+w,Duo+x,Dg+s,Fug+w,Fugo-x \
                   --delete -m \
                   --filter '- runtime/' \
                   --filter '- .ipynb_checkpoints/' \
                   --filter '+,s */' \
                   --filter '+ scripts/**' \
                   --filter '- *' \
                   ${root_dir}/ server1:/my/projects/dir/on/remote1
           rsync -rltvP \
                   --perms --chmod=ugo+r,Dug+w,Duo+x,Dg+s,Fug+w,Fugo-x \
                   --delete -m \
                   --filter '- runtime/' \
                   --filter '- .ipynb_checkpoints/' \
                   --filter '+,s */' \
                   --filter '+ scripts/**' \
                   --filter '- *' \
                   ${root_dir}/ server2:/my/projects/dir/on/remote2
        done
}
alias zhan-start-work='zhan-start-work'
