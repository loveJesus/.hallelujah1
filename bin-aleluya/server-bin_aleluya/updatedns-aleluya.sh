#!/bin/zsh
# For God so loved the world
# That He gave His only begotten Son
# That all who believe in Him should not perish
# But have everlasting life

#DIR_ALELUYA=`dirname $0:A:h`
DIR_ALELUYA=`dirname $(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)/$(basename -- "$0")")`
#"$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASEDOMAIN_ALELUYA=`cat $DIR_ALELUYA/../etc-aleluya/basedomain-aleluya`
echo $BASEDOMAIN_ALELUYA

function nameCheapComboSetDefault_aleluya {
  echo $1 ALELUYA - DOMAIN
  sld_aleluya=`echo $1 | cut -d'.' -f1`
  tld_aleluya=`echo $1 | cut -d'.' -f2`
  curl "https://api.namecheap.com/xml.response?ApiUser=brianloveJesus&ApiKey=$NAMECHEAP_API_KEY_aleluya&UserName=brianloveJesus&ClientIp=$NAMECHEAP_CLIENT_IP_aleluya&PageSize=100&Command=namecheap.domains.dns.setDefault&SLD=$sld_aleluya&TLD=$tld_aleluya"
  namecheap-api-cli-aleluya --del --domain $sld_aleluya.$tld_aleluya --name www --type CNAME --address parkingpage.namecheap.com.
  namecheap-api-cli-aleluya --del --domain $sld_aleluya.$tld_aleluya --name @ --type URL --address http://www.$sld_aleluya.$tld_aleluya/
}

#nameCheapComboSetDefault_aleluya $BASEDOMAIN_ALELUYA

cat $DIR_ALELUYA/../etc-aleluya/hosts-aleluya | while read aleluya; do
  IP_ALELUYA=`echo $aleluya | tr -s ' '| cut -d' ' -f1`
  DOMAIN_ALELUYA=`echo $aleluya| tr -s ' ' | cut -d' ' -f2`
  SUBDOMAIN_ALELUYA=`basename -s .$BASEDOMAIN_ALELUYA $DOMAIN_ALELUYA`
  if [ "$SUBDOMAIN_ALELUYA" = "$BASEDOMAIN_ALELUYA" ]; then SUBDOMAIN_ALELUYA="@"; fi
    
  namecheap-api-cli-aleluya --list --domain $BASEDOMAIN_ALELUYA | grep "A.*$SUBDOMAIN_ALELUYA.*>" | cut -d'>' -f2 | while read OIP_ALELUYA; do
    echo HALLELUJAH $OIP_ALELUYA -\> $IP_ALELUYA
    namecheap-api-cli-aleluya --del --domain $BASEDOMAIN_ALELUYA --name $SUBDOMAIN_ALELUYA --type A --address $OIP_ALELUYA
  done

  echo namecheap-api-cli-aleluya --add --domain $BASEDOMAIN_ALELUYA --type A --name $SUBDOMAIN_ALELUYA --address $IP_ALELUYA
  namecheap-api-cli-aleluya --add --domain $BASEDOMAIN_ALELUYA --type A --name $SUBDOMAIN_ALELUYA --address $IP_ALELUYA
done

cat $DIR_ALELUYA/../etc-aleluya/hosts-other-aleluya | while read aleluya; do
  TYPE_ALELUYA=`echo $aleluya| tr -s ' ' | cut -d' ' -f1`
  DOMAIN_ALELUYA=`echo $aleluya| tr -s ' ' | cut -d' ' -f2`
  TARGET_ALELUYA=`echo $aleluya| tr -s ' ' | cut -d' ' -f3`
  SUBDOMAIN_ALELUYA=`basename -s .$BASEDOMAIN_ALELUYA $DOMAIN_ALELUYA`
  if [ "$SUBDOMAIN_ALELUYA" = "$BASEDOMAIN_ALELUYA" ]; then SUBDOMAIN_ALELUYA="@"; fi
   namecheap-api-cli-aleluya --list --domain $BASEDOMAIN_ALELUYA | grep "$TYPE_ALELUYA.*$SUBDOMAIN_ALELUYA.*>" | cut -d'>' -f2 | while read OIP_ALELUYA; do
    echo HALLELUJAH $OIP_ALELUYA -\> $IP_ALELUYA
    namecheap-api-cli-aleluya --del --domain $BASEDOMAIN_ALELUYA --name $SUBDOMAIN_ALELUYA --type $TYPE_ALELUYA --address $OIP_ALELUYA
  done


  echo namecheap-api-cli-aleluya --add --domain $BASEDOMAIN_ALELUYA --type $TYPE_ALELUYA --name $SUBDOMAIN_ALELUYA --address $TARGET_ALELUYA
  namecheap-api-cli-aleluya --add --domain $BASEDOMAIN_ALELUYA --type $TYPE_ALELUYA --name $SUBDOMAIN_ALELUYA --address $TARGET_ALELUYA
done

