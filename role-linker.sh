#!/usr/bin/env bash
# turn on nullglob to get array of files without wonky use of ls
PLATFORM=$(uname)

if [[ "$PLATFORM" == "Linux" ]]; then
  ROLEDEST=/etc/ansible/roles
elif [[ "$PLATFORM" == "Darwin" ]]; then
  ROLEDEST=/usr/local/etc/ansible/roles
fi

ROLESRC=$HOME/Workspace/xyzrbt/ansible

shopt -s nullglob
cd $ROLESRC
ROLES=(xyzrbt*)

# iterate through dot-* files array in $DF and symlink it to the $HOME directory
for ROLE in ${ROLES[@]}; do
  ROLELINK=$ROLEDEST/${ROLE}
  # remove existing role links
  [[ -e $ROLELINK ]] && sudo rm -rfv $ROLELINK
  # link
  sudo ln -v -s $ROLESRC/$ROLE $ROLELINK
done

# turn off nullglob
shopt -u nullglob
