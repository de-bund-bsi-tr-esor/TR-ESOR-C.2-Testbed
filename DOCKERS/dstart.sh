#!/bin/sh

echo [i] starting all needed docker containers: xsv-srv and erv-srv
echo

./xsv-srv/dstart.sh

./erv-srv/dstart.sh

echo [i] status of the docker containers:
echo
docker ps
echo

