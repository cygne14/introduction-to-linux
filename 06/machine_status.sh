#!/bin/bash

teams=()
status=()
novy=true
notquiet=true
j=0
k=0

#kdyz cat hodi chybu tak se cte z FILE, prenpinac -i
input=$( cat /srv/nswi177/machine.status 2>/dev/null )


if [ "$#" -gt 0 ]; then

  while echo "$1" | grep -q "-"; do  #pokud argument obsahuje -
    
    if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
      echo "Usage: machine_state.sh [options] [machine-filter]"
      echo " -h --help            Print this help."
      echo " -i --input FILE      Read state from FILE."
      echo " -q --quiet --silent  No output, only exit code."
      exit 0
    fi
    
    if [ "$1" = "--silent" ] || [ "$1" = "--quiet" ] || [ "$1" = "-q" ]; then
      notquiet=false
      shift
    elif [ "$1" = "--input" ] || [ "$1" = "-i" ]; then
      shift
      input=$( cat "$1" 2>/dev/null )
      
      if [ "$input" = "" ]; then
        exit 102
      fi
      
      shift
    else #spatny argument
      exit 101
    fi
    
      
  done
fi

if [ "$#" -gt 0 ]; then

  input=$( echo "$input" | grep "$1" )
  
  if [ "$input" = "" ]; then
    exit 2
  fi
fi


while read -r line; do
  name=$( echo "$line" | cut -d ":" -f 1 - ) 
  
  for i in "${teams[@]}"; do
    if [ "$i" = "$name" ]; then
      novy=false
      
      c=$( echo "$line" | cut -d ":" -f 3 - )
      status[$k]="${status[$k]}+$c"
      
      break
    fi
    
    k=$(( k+1 ))
    novy=true
  done
  
  if "$novy"; then
    teams[$j]="$name"
    status[$j]=$( echo "$line" | cut -d ":" -f 3 - )
    j=$(( j + 1 )) 
    novy=false
  fi
  
  k=0

done < <(echo "$input")

l="${#teams[@]}"
l=$(( l - 1 ))

sum=0

for i in $( seq 0 $l ); do
  c=$( echo "${status[$i]}" | bc )
  
  sum=$(( sum + c ))
  
  if $notquiet; then
    if [ "$c" -eq 0 ]; then
      echo "${teams[$i]}: UP"
    else
      down=$( echo "${status[$i]}" | grep 0 | bc )
      if [ "$down" = "" ]; then
        echo "${teams[$i]}: DOWN"
      else
        echo "${teams[$i]}: DEGRADED"
      fi
    fi
  fi
  
  if [ "$l" = "$i" ]; then
    
    if [ "$sum" = 0 ]; then
      exit 0
    else 
      exit 1
    fi
    
  fi
  
done | sort

