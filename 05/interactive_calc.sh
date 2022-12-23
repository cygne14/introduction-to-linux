#!/bin/bash

set -ueo pipefail

if [ "$#" -eq 0 ] || [ "$1" = "-" ]; then
  input=$( cat )
else
  input=$( cat "$1" 2>/dev/null || exit 1)
fi

result=0

echo "$input" | while read line; do  
  result=$( echo "$result $line" | bc )
  echo "= $result"
done | tail -n 1


