# For God so loved the world, that He gave His only begotten Son
# That all who believe in Him should not perish, but have everlasting life

for aleluya in *-aleluya; do echo ALELUYA $aleluya; nm_aleluya=`basename -s -aleluya $aleluya`; 
  echo HALLELUJAH $aleluya

  mkdir -p $aleluya/public-aleluya 
  ln -fs ../../data_aleluya/placeholder-aleluya.html $aleluya/public-aleluya/
  mkdir -p $aleluya/bin-aleluya $aleluya/etc-aleluya; 

  echo $nm_aleluya  >| $aleluya/etc-aleluya/basedomain-aleluya; 
  if [ ! -f $aleluya/etc-aleluya/hosts-aleluya ]; then 
    echo $NAMECHEAP_CLIENT_IP_aleluya $nm_aleluya  >| $aleluya/etc-aleluya/hosts-aleluya; 
    echo $NAMECHEAP_CLIENT_IP_aleluya www.$nm_aleluya >> $aleluya/etc-aleluya/hosts-aleluya; 
    echo $NAMECHEAP_CLIENT_IP_aleluya mail.$nm_aleluya >> $aleluya/etc-aleluya/hosts-aleluya; 
  fi
  
  if [ ! -f $aleluya/etc-aleluya/hosts-other-aleluya ]; then 
    echo MX @  mail.$nm_aleluya  > $aleluya/etc-aleluya/hosts-other-aleluya; 
  fi

  if [ ! -f $aleluya/etc-aleluya/email-boxes-aleluya ]; then 
    echo forgive-us aleluya@$nm_aleluya > $aleluya/etc-aleluya/email-boxes-aleluya;
  fi
  if [ ! -f $aleluya/etc-aleluya/email-forwards-aleluya ]; then 
    echo aleluya@$nm_aleluya loveJesus@loveJesus.xyz > $aleluya/etc-aleluya/email-forwards-aleluya;
  fi
 
  DIR_ALELUYA=`pwd`/$aleluya;
  
#  if [ ! -f $aleluya/etc-aleluya/nginx-aleluya.conf ]; then 
cat <<ALELUYA >| $aleluya/etc-aleluya/nginx-aleluya.conf
server {
    listen 80;
    listen [::]:80;
    #SSL-ALELUYA listen 443 ssl;

    #SSL-ALELUYA ssl_certificate      /etc/letsencrypt/live/$nm_aleluya/fullchain.pem;
    #SSL-ALELUYA ssl_certificate_key  /etc/letsencrypt/live/$nm_aleluya/privkey.pem;

    server_name $nm_aleluya www.$nm_aleluya;
    root $DIR_ALELUYA/public-aleluya;
    index index.php index.html index.cgi index.htm aleluya.html aleluya.php placeholder-aleluya.html;

    location ^~ /mail-aleluya {
        index index.php;

        location ~ /mail-aleluya/.*.php {
           index index.php;
           include snippets/fastcgi-php.conf;
           fastcgi_pass unix:/run/php/php7.2-fpm.sock;
        }
        location ^~ /mail-aleluya/data {
                deny all;
        }
    }

    location ~ /*.php {
        index index.php;
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
    }


    location / {
    }
#    location / {
#        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#        proxy_set_header X-Forwarded-Proto $scheme;
#        proxy_set_header X-Real-IP $remote_addr;
#        proxy_set_header Host $http_host;
#        proxy_pass http://127.0.0.1:2368;
#    }

    location ~ /.well-known {
        allow all;
    }
    client_max_body_size 50m;
}
ALELUYA

  sudo ln -fs $DIR_ALELUYA/etc-aleluya/nginx-aleluya.conf /etc/nginx/sites-enabled/$aleluya.conf

  ln -fs ../../bin_aleluya/updatedns-aleluya.sh $aleluya/bin-aleluya/
  ln -fs ../../bin_aleluya/updatemail-aleluya.sh $aleluya/bin-aleluya/
  ln -fs ../../bin_aleluya/mkcert-aleluya.sh $aleluya/bin-aleluya/
#  $aleluya/bin-aleluya/updatedns-aleluya.sh
done
