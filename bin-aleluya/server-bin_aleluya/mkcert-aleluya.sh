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
sudo certbot certonly  --webroot-path /var/www/vhosts-aleluya/${BASEDOMAIN_ALELUYA}-aleluya/public-aleluya/ --webroot -d $BASEDOMAIN_ALELUYA -d www.$BASEDOMAIN_ALELUYA
