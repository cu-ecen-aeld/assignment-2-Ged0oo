#!/bin/bash

writefile=$1
writestr=$2
direname=$(dirname "$writefile")

if [ -z "$writefile" ] || [ -z "$writestr" ] || [ $# -eq 0 ] ; then
    echo "Error: Missing arguments"
    exit 1
fi

if [[ ! -e "$writefile" ]]; then
    mkdir -m 775 -v -p "$direname"
    touch "$writefile" && chmod 775 "$writefile"
fi

if [ -e "$writefile" ]; then
    echo -e "$writestr" > "$writefile"
    echo "File created and its content:"
    cat "$writefile"
    exit 0
else
    echo "File won't be created"
    exit 1
fi
