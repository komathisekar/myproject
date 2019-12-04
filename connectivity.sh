
#bash script which checks connectivity to multiple servers in multiple ports
for HOST in $(cat host.host)   #loop to take the hostname from the file
do
 for PORT in $(cat port.port)  #loop to take the port number from the file
 do
  sleep 1 | nc -w 3 $HOST $PORT && echo "$HOST $PORT connected" || echo "$HOST $PORT Disconnected" #checking the connectivity using netcat by seeting timeout for 1 sec and print the status
  done
done
