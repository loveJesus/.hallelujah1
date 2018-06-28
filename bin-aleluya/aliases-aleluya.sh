#!/bin/bash
# For God so loved the world
# That He gave His only begotten SOn, That all who believe in Him should not perish
# But have everlasting life
#hallelujah
#convert -size 2400x1200 xc:White -gravity Center -weight 700 -pointsize 200  -annotate 0 "$2" $3
export CROSS_ALELUYA=✝
export J316G_ALELUYA="ουτως γαρ ηγαπησεν ο θεος τον κοσμον, ωστε τον υιον αυτου τον μονογενη εδωκεν, ινα πας ο πιστευων εις αυτον μη αποληται αλλα εχῃ ζωην αιωνιον."

alias ddp_aleluya='sed -r "/^:/, \$d" | sed "/^\s*$/d" | sed "/^(ESV2011)$/d" | awk "/^[a-zA-Z0-9 ]+:[0-9]+:/ {if (NR!=1){printf \"\n%s\",\$0;}else printf \"%s\",\$0;next; }{printf \" %s\",\$0;}END{print \"\";}" | sed -r "s/\s+/ /g"'

function titleImgAleluya {
  convert "$1" -font /usr/share/fonts/TTF/DejaVuSans.ttf -stroke black -fill white -gravity Center -weight 700 -pointsize 30  -annotate 0 "$2" "$3"
}

function guitar-chord2-aleluya { 
  # God be praised - https://gschoppe.com/js/json-chords/
  zcat ~/.hallelujah1/chordlibrary.json.gz| jq ".EADGBE | {aleluya: [.\"$1\"[].p] } " 
}
alias bblAleluya='diatheke -f plain -b ESV2011 -k '
alias xclip='xclip -selection clipboard '

function bbldAleluya {
  bblAleluya $@ | ddp_aleluya
}
function bblsAleluya {
  #remember mkfastmod to make the search module, God be praised
  diatheke -f plain -b ESV2011 -k "`diatheke -b ESV2011 -s lucene -k $@ | cut -d '-' -f 3`"
}
alias showSongsAleluya='cat * | sed -r "s/Title: /\n\n--------------------\nTitle: /g" | less'
function grpAleluya {
  grep $@ * -l | while read aleluya ; do (echo "\n\n-------------" ; cat $aleluya) ; done | less
}

function postit_aleluya {
  nxxd_aleluya=`curl -X POST -H "Content-Type: $2" --data-binary "@$1"  https://loveJesus.xyz/sha-aleluya/input-aleluya.php\?lnk-aleluya\=$3 | xxd -ps | paste -sd ''`
  echo $nxxd_aleluya | tee -a ~/lposts_aleluya
}
function dreamhost_api_aleluya {
  cmd_aleluya="${1:-api-list_accessible_cmds}"  
  curl "https://api.dreamhost.com/?key=$DREAMHOST_API_KEY_aleluya&unique_id=`date | md5sum | cut -d' ' -f1`&format=tab&cmd=$cmd_aleluya"
}
function readit_aleluya {
  curl https://loveJesus.xyz/sha-aleluya/$1
}

function nameCheapRefreshDomains_aleluya {
  #Hallelujah for dananos @  https://blog.dotnetframework.org/2016/04/15/how-to-export-a-list-of-domains-from-namecheap/ in Jesus name
curl "https://api.namecheap.com/xml.response?ApiUser=brianloveJesus&ApiKey=$NAMECHEAP_API_KEY_aleluya&UserName=brianloveJesus&Command=namecheap.domains.getList&ClientIp=$NAMECHEAP_CLIENT_IP_aleluya&PageSize=100" | ~/bin-aleluya/xml2json-aleluya.py | python -mjson.tool >| domains-nc-aleluya.json
if [ "$1" = aleluya ]; then
  mkdir -p domains-aleluya
  nohup cat domains-nc-aleluya.json| grep @Name | cut -d':' -f 2 | tr -d , | tr -d \" | while read domain_aleluya; do 
   sld_aleluya=`echo $domain_aleluya | cut -d'.' -f 1`; 
   tld_aleluya=`echo $domain_aleluya | cut -d'.' -f 2`; 
   curl "https://api.namecheap.com/xml.response?ApiUser=brianloveJesus&ApiKey=$NAMECHEAP_API_KEY_aleluya&UserName=brianloveJesus&ClientIp=$NAMECHEAP_CLIENT_IP_aleluya&PageSize=100&Command=namecheap.domains.dns.getList&SLD=$sld_aleluya&TLD=$tld_aleluya" >| domains-aleluya/$domain_aleluya.aleluya &; 
   echo ALELUYA $domain_aleluya; 
   sleep 0.1
 done 
fi
}

function jsonPP_aleluya {
	cat $1 | python -m json.tool | pygmentize
}
function nameCheapSetCustom_aleluya {
  sld_aleluya=$1
  tld_aleluya=$2
  ns_aleluya=$3
  curl "https://api.namecheap.com/xml.response?ApiUser=brianloveJesus&ApiKey=$NAMECHEAP_API_KEY_aleluya&UserName=brianloveJesus&ClientIp=$NAMECHEAP_CLIENT_IP_aleluya&PageSize=100&Command=namecheap.domains.dns.setCustom&SLD=$sld_aleluya&TLD=$tld_aleluya&NameServers=$ns_aleluya"  
}
function nameCheapSetDefault_aleluya {
  sld_aleluya=$1
  tld_aleluya=$2
  curl "https://api.namecheap.com/xml.response?ApiUser=brianloveJesus&ApiKey=$NAMECHEAP_API_KEY_aleluya&UserName=brianloveJesus&ClientIp=$NAMECHEAP_CLIENT_IP_aleluya&PageSize=100&Command=namecheap.domains.dns.setDefault&SLD=$sld_aleluya&TLD=$tld_aleluya"  
  namecheap-api-cli-aleluya --del --domain $sld_aleluya.$tld_aleluya --name @ --type URL --address http://www.$sld_aleluya.$tld_aleluya/
  namecheap-api-cli-aleluya --del --domain $sld_aleluya.$tld_aleluya --name www --type CNAME --address parkingpage.namecheap.com.
}

function nameCheapFilesDisplay_aleluya {
  for aleluya in *.aleluya; do echo '~' ; echo ALELUYA $aleluya ---- ; cat $aleluya | grep Nameserver | sed -r 's/.*>(.*)<.*/\1/g'; done | paste -sd' ' | tr '~' '\n' 
}

function speed-test-aleluya {
  #Thank You Jesus for mweisel, zanna https://askubuntu.com/a/269821
  curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
}

function noSshKeyCheckAleluya {
    # Add the servers to the sshloginfile
  (echo servera; echo serverb) > .parallel/my_cluster
  # Make sure .ssh/config exist
  touch .ssh/config
  cp .ssh/config .ssh/config.backup
  # Disable StrictHostKeyChecking temporarily
  (echo 'Host *'; echo StrictHostKeyChecking no) >> .ssh/config
  parallel --slf my_cluster --nonall true
  # Remove the disabling of StrictHostKeyChecking
  mv .ssh/config.backup .ssh/config
}
