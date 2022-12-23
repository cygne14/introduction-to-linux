#!/bin/bash


if test -f /srv/nswi177/arabidopsis.fasta; then

  pole=$( tail -n+2 < /srv/nswi177/arabidopsis.fasta | tr -d "\n" | grep -o "$1" | sort | uniq )

  echo "$pole" | while read -r line; do
  
    comp=$( echo "$line" | sed "s/A/-/g" | sed "s/T/A/g" | sed "s/-/T/g" | sed "s/C/-/g" | sed "s/G/C/g" | sed "s/-/G/g" )
  
    echo "$line"
  
    neco=$( tail -n+2 < /srv/nswi177/arabidopsis.fasta | tr -d "\n" | grep -bo "$comp" )
  
    if [ "$neco" != "" ]; then
  
      echo "$neco" | while read -r linee; do
    
        cislo=$( echo "$linee" | cut -d ":" -f 1 )
        cislo=$(( cislo / 70 + 2 ))
        echo -n "$cislo:"
        echo "$linee" | cut -d ":" -f 2
     
      done
    
    fi
  
  done

else

  echo "arabidopsis.fasta file missing" 1>&2
  exit 7

fi


