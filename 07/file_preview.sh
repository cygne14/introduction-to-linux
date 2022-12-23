#!/bin/bash


ec1=false

while [ "$#" -gt 0 ]; do

  if test -f "$1"; then
 
    echo "--- $1 ---"
  
    typ=$( file --mime-type "$1" | cut -d ":" -f 2 | tr -d " " )
  
    case "$typ" in
      text/*) head -n 30 < "$1" ;;
    
      application/pdf) pdftotext < "$1" | head -n 30 ;;
     
      image/*) exiftool < "$1" | head -n 30 ;;
    
      video/*) exiftool < "$1" | head -n 30 ;;
     
      *) file < "$1" | head -n 30 ;;
    esac
  
    echo ""
    
  else
  
    ec1=true
   
  fi
  
  shift
  
done

if "$ec1"; then
  exit 1
else
  exit 0
fi
