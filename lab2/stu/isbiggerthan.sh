#!/bin/bash
# Written by: MIDN 3/C Tristan Lee on 01/23/2024

# Check the number of arguements
if [ "$#" -ne 2 ]; then
    echo "ERROR: Require path and size" >&2
    exit 1
fi

size="$1"
path="$2"

# Check if the 1st arguement is a number
if ! [[ "$size" =~ ^[-+]?[0-9]+$ ]]; then
    echo "ERROR: Require a number for size" >&2
    exit 1
fi

# Check if the number entered is a positive number
if ! [[ "$size" =~ ^[+]?[0-9]+$ ]]; then
    echo "ERROR: Require a positive number for size" >&2
    exit 1
fi

# Check if the file exists
if [ ! -f "$path" ]; then
    echo "ERROR: File $path does not exist" >&2
    exit 1 
fi

fileSize=$(stat -c%s "$path")
if [ "$fileSize" -ge "$size" ]; then
        echo "yes"
    else
        echo "no"
fi 


