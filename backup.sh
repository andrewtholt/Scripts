#!/usr/bin/env bash

# set -x


if [ $# -eq 0 ]; then 
    echo "Backup.sh <list of directories>"
    echo 
    echo "Note: Backup creates a gzipped tar file in the current directory."

    exit 1
fi

NOW=$(date +%Y%m%d%H%M)

NAME=$(echo "backup$NOW.tgz")

echo  $NAME

tar --exclude-vcs -zcvf $NAME "$*"

