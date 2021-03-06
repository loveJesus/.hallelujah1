#!/bin/bash
# For God so loved the world, that He gave his only begotten Son, that all who 
# Believe in Him should not perish, but have everlasting life
PATH=$PATH:~/bin-aleluya

. ~/.envhere-aleluya

$KAFKA_IN_CMD_ALELUYA myfilter-aleluya | while read aleluya; do
  if [[ "$aleluya" =~ "Jesus is Lord" ]]; then
    echo AMEN
  fi
  echo $aleluya
  if [[ "$aleluya" =~ ^[-a-z0-9]+$ ]]; then
    echo "God is Holy"
    if [[ -f ~/bin-aleluya/myfilter-aleluya/$aleluya.sh ]]; then
      ~/bin-aleluya/myfilter-aleluya/$aleluya.sh
    fi
  fi

done

