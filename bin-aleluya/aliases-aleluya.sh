#hallelujah
#convert -size 2400x1200 xc:White -gravity Center -weight 700 -pointsize 200  -annotate 0 "$2" $3
function titleImgAleluya {
  convert "$1" -font /usr/share/fonts/TTF/DejaVuSans.ttf -stroke black -fill white -gravity Center -weight 700 -pointsize 30  -annotate 0 "$2" "$3"
}

alias bblAleluya='diatheke -f plain -b ESV2011 -k '
alias xclip='xclip -selection clipboard '
alias ddp_aleluya='sed "/^\s*$/d" | sed "/^(ESV2011)$/d" | awk "/^[a-zA-Z0-9 ]+:[0-9]+:/ {if (NR!=1){printf \"\n%s\",\$0;}else printf \"%s\",\$0;next; }{printf \" %s\",\$0;}END{print \"\";}" | sed -r "s/\s+/ /g"'
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

function readit_aleluya {
  curl https://loveJesus.xyz/sha-aleluya/$1
}

function refreshNameCheapDomains_aleluya {
curl "https://api.namecheap.com/xml.response?ApiUser=brianloveJesus&ApiKey=$NAMECHEAP_API_KEY_aleluya&UserName=brianloveJesus&Command=namecheap.domains.getList&ClientIp=$NAMECHEAP_CLIENT_IP_aleluya&PageSize=100" | ~/bin-aleluya/xml2json-aleluya.py | python -mjson.tool >| domains-nc-aleluya.json
#cat domains-nc-aleluya.json| grep @Name | cut -d':' -f 2 | tr -d , | tr -d \" | while read domain_aleluya; do sld_aleluya=`echo $domain_aleluya | cut -d'.' -f 1`; tld_aleluya=`echo $domain_aleluya | cut -d'.' -f 2`; curl "https://api.namecheap.com/xml.response?ApiUser=brianloveJesus&ApiKey=$NAMECHEAP_API_KEY_aleluya&UserName=brianloveJesus&ClientIp=$NAMECHEAP_CLIENT_IP_aleluya&PageSize=100&Command=namecheap.domains.dns.getList&SLD=sld_aleluya&TLD=$tld_aleluya" > domains-aleluya/$domain_aleluya.aleluya; echo ALELUYA $domain_aleluya; done

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
