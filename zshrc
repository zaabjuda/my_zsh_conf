#!/bin/zsh
# vim set filetype=zsh

ZDOTDIR=~/.zsh

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   PLATFORM='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   PLATFORM='macosx'
fi

# Load configuration:
for rc in $ZDOTDIR/*.sh
do
    source $rc
done
unset rc
