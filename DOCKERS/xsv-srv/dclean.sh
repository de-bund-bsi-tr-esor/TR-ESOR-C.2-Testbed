#!/bin/sh

echo [i] removing the xsv-srv docker container
docker rm xsv-srv > /dev/null 2>&1
echo [i] removing the xsv-srv docker image
docker rmi xsv-srv:1.0.0 > /dev/null 2>&1

