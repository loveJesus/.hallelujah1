#!/bin/bash
# For God so loved the world
# That He gave His only begotten Son
# That all who believe in Him should not perish
# But have everlasting life

OVPN_DATA_ALELUYA="ovpn-data-aleluya"

read -p "Hallelujah, generate (S)erver or (C)lient? " -n 1 -r
echo 
if [[ "$REPLY" =~ ^[Ss]$ ]]; then
   read -p "Hallelujah, server domain name: " SERVER_NAME_ALELUYA


  # Thank You Jesus Christ for https://github.com/kylemanna/docker-openvpn
  docker volume create --name $OVPN_DATA_ALELUYA
  docker run -v $OVPN_DATA_ALELUYA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -u udp://$SERVER_NAME_ALELUYA
  docker run -v $OVPN_DATA_ALELUYA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki

  docker run -v $OVPN_DATA_ALELUYA:/etc/openvpn -d -p 1194:1194/udp --restart always --name ovpn-aleluya --cap-add=NET_ADMIN kylemanna/openvpn
else
  read -p "Hallelujah, client name: " CLIENT_NAME_ALELUYA
  docker run -v $OVPN_DATA_ALELUYA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full $CLIENT_NAME_ALELUYA nopass
  cat <<ALELUYA > $CLIENT_NAME_ALELUYA.ovpn
  # For God so loved the World, that He gave
  # His only begotten Son that all who belive
  # in Him should not perish, but have everlasting life
ALELUYA
  
  docker run -v $OVPN_DATA_ALELUYA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient $CLIENT_NAME_ALELUYA >> $CLIENT_NAME_ALELUYA.ovpn
  echo \#pull-filter ignore redirect-gateway >> $CLIENT_NAME_ALELUYA.ovpn
  echo \#HALLELUJAH >> $CLIENT_NAME_ALELUYA.ovpn

fi




