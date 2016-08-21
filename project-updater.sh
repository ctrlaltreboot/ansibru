#!/usr/bin/env bash

# turn on nullglob to get array of files without wonky use of ls

PROJECTS=$HOME/Workspace/xyzrbt/ansible

shopt -s nullglob
ROLES=($PROJECTS/xyzrbt*)

# iterate
for ROLE in ${ROLES[@]}; do
  echo "Updating $ROLE"
  cd $ROLE && git checkout  -f && git pull --rebase
done

# turn off nullglob
shopt -u nullglob
