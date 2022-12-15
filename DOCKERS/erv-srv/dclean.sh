#!/bin/sh

echo [i] removing docker container erv-srv
docker rm erv-srv > /dev/null 2>&1
echo [i] removing docker image erv-srv
docker rmi erv-srv:1.0.0 > /dev/null 2>&1

