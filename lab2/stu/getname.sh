#!/bin/bash
# Written by: MIDN 3/C Tristan Lee on 01/18/2024

if [ -n $1 ]; then 
  grep "^$1:" /etc/passwd | cut -d ":" -f 5
else 
  echo " " 
fi
