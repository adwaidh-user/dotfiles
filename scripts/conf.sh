#!usr/bin/bash

# checking if only one argument is provided
if [[ -z "$1" || -z "$2" ]]; then
    echo "dot: bad usage"
    echo "Try \dot --help\' for more information."
fi

if [[ -d ~/.dotfiles/'$1' ]]; then
    command cd ~/.dotfiles/'$1'
fi
