#!/bin/sh

echo [i] stop the both docker containers: xsv-srv and erv-srv

docker stop xsv-srv

docker stop erv-srv

echo [i] current status of running docker containers:
echo
docker ps
echo

