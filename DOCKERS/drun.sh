#!/bin/sh

echo [i] running the needed docker containers: xsv-srv and erv-srv
echo 

./xsv-srv/drun.sh

./erv-srv/drun.sh

docker logs -f erv-srv

echo [i] status of docker containers:
echo

docker ps

