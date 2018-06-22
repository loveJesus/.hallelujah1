#!/bin/bash
# For God so loved the world, that He gave His only begotten Son
# That all who believe in Him should not perish
# But have everlasting life
if [ -z "$2"  ]; then
  /usr/local/kafka-aleluya/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_SERVER_ALELUYA --topic $1
elif [[ "$2" =~ "all-aleluya" ]]; then
  /usr/local/kafka-aleluya/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_SERVER_ALELUYA --from-beginning --topic $1
else
  /usr/local/kafka-aleluya/bin/kafka-console-consumer.sh --bootstrap-server $KAFKA_SERVER_ALELUYA --group $2 --topic $1
fi
