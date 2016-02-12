# ~/.bash_custom/.programs.config.sh: add to the environment variables
# the directories of executables/libraries/header files of a programs
# installed using the home directory scheme and a separate and
# individual directory (under ~/Programs).

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


# LD_LIBRARY_PATH="$HOME/anaconda/lib:/usr/local/lib:/usr/lib:/lib:/lib64"
# set LD_LIBRARY_PATH so it includes user's private lib if it exists
if [ -d "$HOME/lib" ] ; then
    if [ -n "$LD_LIBRARY_PATH" ] ; then
	LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
    else
        export LD_LIBRARY_PATH="$HOME/lib"
    fi

fi
if [ -d "$HOME/lib64" ] ; then
    if [ -n "$LD_LIBRARY_PATH" ] ; then
        LD_LIBRARY_PATH="$HOME/lib64:$LD_LIBRARY_PATH"
    else
        export LD_LIBRARY_PATH="$HOME/lib64"
    fi
fi


# CPATH="$HOME/anaconda/include:/usr/local/include:/usr/include"
# set CPATH so it includes user's private include if it exists, for C,
# C++ and object-C regardless of which language is preprocessed.
if [ -d "$HOME/include" ] ; then
    if [ -n "$CPATH" ] ; then
        CPATH="$HOME/include:$CPATH"
    else
        export CPATH="$HOME/include"
    fi
fi

PRM_PATH="$HOME/Programs"
