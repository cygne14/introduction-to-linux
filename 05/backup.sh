#!/bin/bash

set -uoe pipefail

while [ $# -gt 0 ]; do
  rp=$( realpath "$1" )
  to_copy=$( echo "$rp" | tr -t "/" "~" )
 
  cp -R $rp "${BACKUP_DIR}/$( date "+%Y-%m-%d_%T_" | tr -t ":" "-")$to_copy"
  
  echo "$BACKUP_DIR/$( ls $BACKUP_DIR --sort=time | head -n 1 )"

  shift
done



