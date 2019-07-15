#!/bin/bash
for HOST in $(cat host.host)
do
 for PORT in $(cat port.port)
 do
  sleep 1 | nc -w 3 $HOST $PORT && echo "$HOST $PORT connected" || echo "$HOST $PORT Disconnected"
  done
done
