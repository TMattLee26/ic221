#!/bin/bash
# Written by: MIDN 3/C Tristan Lee on 01/18/2024

for arg in $*
do
  if [ -f $arg ]; then
    size=$(stat -c %s $arg)
    echo "$arg $size"
  else
    echo "ERROR: File $arg does not exist" >&2
  fi
done
