#!/bin/bash
# Written by: MIDN 3/C Tristan Lee on 01/23/2024

if [ "$#" -lt 2 ]; then
    echo "ERROR: Require a size and at least one file" >&2
    exit 1
fi

size="$1"

# Check if the 1st arguement is a number
if ! [[ "$size" =~ ^[-+]?[0-9]+$ ]]; then
    echo "ERROR: Require a number for size" >&2
    exit 2
fi

# Check if the number entered is a positive number
if ! [[ "$size" =~ ^[+]?[0-9]+$ ]]; then
    echo "ERROR: Require a positive number for size" >&2
    exit 3
fi

# Source https://unix.stackexchange.com/questions/92978/what-does-this-2-mean-in-shell-scripting
for arg in "${@:2}"
do
    if [ -f $arg ]; then
        fileSize=$(stat -c%s $arg)
        if [ "$fileSize" -ge "$size" ]; then
                echo "$arg"
        fi
    else
        echo "ERROR: File $arg does not exist" >&2
    fi
done