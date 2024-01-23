#!/bin/bash
# Written by: MIDN 3/C Tristan Lee on 01/18/2024

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>" >&2
    exit 1
fi

if [ -f $1 ]; then
  stat -c %s $1
else
  echo "ERROR: File $1 does not exist" >&2
  exit 1
fi

