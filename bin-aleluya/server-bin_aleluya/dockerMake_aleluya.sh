# For God so loved the world
# That He gave His only begotten Son
# That all who believe in Him should not perish but have everlasting life
NAME_ALELUYA=$1
docker run -d -v /var/www/vhosts-aleluya/$NAME_ALELUYA/public-aleluya:/app/htdocs --restart always --name $NAME_ALELUYA aleluya/phpserver1-aleluya
IP_ALELUYA=`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $NAME_ALELUYA`
sudo sed -i "/$NAME_ALELUYA.docker-aleluya/d" /etc/hosts
sudo bash -c "echo $IP_ALELUYA $NAME_ALELUYA.docker-aleluya >> /etc/hosts"
