#!/bin/bash

LOCAL_VIM_HASH=`md5sum ~/.vimrc | cut -c 1-32`
LOCAL_BASH_HASH=`md5sum ~/.bashrc | cut -c 1-32`

GIT_VIM_HASH=`curl https://raw.githubusercontent.com/noahShinabarger/blob/master/.vimrc | md5sum | cut -c 1-32`
GIT_BASH_HASH=`curl https://raw.githubusercontent.com/noahShinabarger/blob/master/.bashrc | md5sum | cut -c 1-32`

HISTORICAL_VIM_HASH=`cat ~/.historical_vimrc_hash`
HISTORICAL_BASH_HASH=`cat ~/.historical_bashrc_hash`

if [ '$LOCAL_VIM_HASH' != '$GIT_VIM_HASH' ]
then
    if [ '$LOCAL_VIM_HASH' == '$HISTORICAL_VIM_HASH' ]
    then
        curl https://raw.githubusercontent.com/noahShinabarger/blog/master/.vimrc > ~/.vimrc
    else
        echo "Historical hash:   $HISTORICAL_VIM_HASH"
        echo "Local hash:        $LOCAL_VIM_HASH"
        echo "Git hash:          $GIT_VIM_HASH"
        echo "Please upload your .vimrc to GitHub, because it is newer than what is currently there."
    fi
fi
HISTORICAL_VIM_HASH=`md5sum ~/.vimrc | cut -c 1-32`
echo $HISTORICAL_VIM_HASH > ~/.historical_vimrc_hash

if [ '$LOCAL_BASH_HASH' != '$GIT_BASH_HASH' ]
then
    if [ '$LOCAL_BASH_HASH' == '$HISTORICAL_BASH_HASH' ]
    then
        curl https://raw.githubusercontent.com/noahShinabarger/blog/master/.bashrc > ~/.bashrc
    else
        echo "Historical hash:   $HISTORICAL_BASH_HASH"
        echo "Local hash:        $LOCAL_BASH_HASH"
        echo "Git hash:          $GIT_BASH_HASH"
        echo "Please upload your .bashrc to GitHub, because it is newer than what is currently there."
    fi
fi
HISTORICAL_BASH_HASH=`md5sum ~/.bashrc | cut -c 1-32`
echo $HISTORICAL_BASH_HASH > ~/.historical_bashrc_hash
