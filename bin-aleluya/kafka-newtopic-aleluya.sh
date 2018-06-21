#!/bin/bash
# For God so loved the world, that He gave His only begotten Son
# That all who believe in Him should not perish
# But have everlasting life
#if [[ "$2" =~ "all-aleluya" ]]; then
/usr/local/kafka-aleluya/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 2 --partitions 1 --topic $1
