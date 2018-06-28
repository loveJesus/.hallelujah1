#!/bin/bash
# For God so loved the world
# That He gave His only begotten Son
# That all who believe in Him should not perish
# But have everlasting life
PDNS_API_KEY_ALELUYA=aleluya7
IFS="|"
cat - | while read CMD_ALELUYA ZONE_ALELUYA RECORD_TYPE_ALELUYA NAME_ALELUYA CONTENT_ALELUYA ; do
    if [ "$CMD_ALELUYA" = add_zone ]; then
	./pdns-aleluya.py delete_zone --apikey "$PDNS_API_KEY_ALELUYA" --zone "$ZONE_ALELUYA"
	./pdns-aleluya.py add_zone  --apikey "$PDNS_API_KEY_ALELUYA" --zone "$ZONE_ALELUYA" --zoneType MASTER --nameserver ns5.jesusministry.faith. --nameserver ns6.jesusministry.faith.
    elif [ "$RECORD_TYPE_ALELUYA" = "MX" ]; then
	./pdns-aleluya.py $CMD_ALELUYA  --apikey "$PDNS_API_KEY_ALELUYA" --zone "$ZONE_ALELUYA" --recordType "$RECORD_TYPE_ALELUYA" --name "$NAME_ALELUYA" --content "$CONTENT_ALELUYA" --priority "10"
    else
	./pdns-aleluya.py $CMD_ALELUYA  --apikey "$PDNS_API_KEY_ALELUYA" --zone "$ZONE_ALELUYA" --recordType "$RECORD_TYPE_ALELUYA" --name "$NAME_ALELUYA" --content "$CONTENT_ALELUYA"
	
    fi
    
    
done 

