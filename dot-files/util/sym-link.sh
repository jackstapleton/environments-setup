#!/bin/bash

echo "Running $0"

BASEDIR=$(dirname $0)

DOTFILESDIR=$BASEDIR/..

LINKFILES="ackrc bash_aliases bash_envvars gitconfig inputrc tmux.conf"

for dotfile in $LINKFILES;
do
    path=$DOTFILESDIR/$dotfile
    if [[ $path != "/"* ]]; then
        path=$(pwd)/$path
    fi
    ln -s $path $HOME/.$dotfile
done

CPFILES="bash_profile"

for dotfile in $CPFILES;
do
    path=$DOTFILESDIR/$dotfile
    if [[ $path != "/"* ]]; then
        path=$(pwd)/$path
    fi
    cp $path $HOME/.$dotfile
done

echo "$0 Complete"
