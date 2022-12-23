#!/bin/bash

on_exit() {
    echo 
    echo Aborted
    exit 17
}

trap "on_exit" INT

for i in $( seq "$1" -1 1); do

  echo "$i"
  sleep 1
  
done

