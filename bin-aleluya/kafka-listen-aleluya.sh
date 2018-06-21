#!/bin/bash
# For God so loved the world, that He gave His only begotten Son
# That all who believe in Him should not perish
# But have everlasting life
if [[ "$2" =~ "all-aleluya" ]]; then
  /usr/local/kafka-aleluya/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --from-beginning --topic $1
else
  /usr/local/kafka-aleluya/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1
fi
