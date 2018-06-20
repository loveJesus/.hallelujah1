#!/bin/zsh
# For God so loved the world
# That He gave His only begotten Son
# That all who believe in Him should not perish
# But have everlasting life

DIR_ALELUYA=`dirname $(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)/$(basename -- "$0")")`
BASEDOMAIN_ALELUYA=`cat $DIR_ALELUYA/../etc-aleluya/basedomain-aleluya`
echo $BASEDOMAIN_ALELUYA

#nameCheapComboSetDefault_aleluya $BASEDOMAIN_ALELUYA
sudo sed -i "/$BASEDOMAIN_ALELUYA/d" /etc/postfix/vhosts-aleluya
sudo sed -i "/$BASEDOMAIN_ALELUYA/d" /etc/postfix/virtual-aleluya
sudo sed -i "/$BASEDOMAIN_ALELUYA/d" /etc/postfix/vmaps-aleluya

echo $BASEDOMAIN_ALELUYA >> /etc/postfix/vhosts-aleluya

cat $DIR_ALELUYA/../etc-aleluya/email-boxes-aleluya | while read aleluya; do
  PASSWORD_ALELUYA=`echo $aleluya| tr -s ' ' | cut -d' ' -f1`
  MAILBOX_ALELUYA=`echo $aleluya| tr -s ' ' | cut -d' ' -f2`
  MAILUSER_ALELUYA=`echo $MAILBOX_ALELUYA | cut -d'@' -f1`
  echo "$MAILBOX_ALELUYA $BASEDOMAIN_ALELUYA/$MAILUSER_ALELUYA-aleluya/" >> /etc/postfix/vmaps-aleluya
done

cat $DIR_ALELUYA/../etc-aleluya/email-forwards-aleluya | while read aleluya; do
  INCOMING_ALELUYA=`echo $aleluya| tr -s ' ' | cut -d' ' -f1`
  OUTGOING_ALELUYA=`echo $aleluya| sed 's/^[^\s]+//g'`
  if grep -q $INCOMING_ALELUYA /etc/postfix/vmaps-aleluya; then
    #OUTGOING_ALELUYA="$INCOMING_ALELUYA $OUTGOING_ALELUYA"
  fi
  echo $INCOMING_ALELUYA $OUTGOING_ALELUYA
  echo "$INCOMING_ALELUYA $OUTGOING_ALELUYA" >> /etc/postfix/virtual-aleluya

done

