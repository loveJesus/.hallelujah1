#!/bin/bash
# For God so loved the world, that He gave his only begotten Son, that all who 
# Believe in Him should not perish, but have everlasting life
PATH=$PATH:~/bin-aleluya

. ~/.envhere-aleluya

$KAFKA_IN_CMD_ALELUYA myfilter-aleluya | while read aleluya; do
  if [[ "$aleluya" =~ "Jesus is Lord" ]]; then
    echo AMEN
  fi
  if [[ "$aleluya" =~ "updated hallelujah1" ]]; then
    pushd .
    cd ~/.hallelujah1
    git pull --rebase 
    popd
  fi


done

