#!/bin/sh

echo [i] removing the docker containers: xsv-srv and erv-srv, if existing
echo

docker rm xsv-srv > /dev/null 2>&1

docker rm erv-srv > /dev/null 2>&1

echo [i] list of known docker containers:
echo

docker ps -a

