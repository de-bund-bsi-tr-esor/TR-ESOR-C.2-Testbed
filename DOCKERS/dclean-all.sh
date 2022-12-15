#!/bin/sh

echo [i] remoiving all docker container and all docker images
echo

./dclean-container.sh

docker rmi xsv-srv:1.0.0 > NUL 2>&1

docker rmi erv-srv:1.0.0 > NUL 2>&1

docker rmi alpine-j11:1.0.0 > NUL 2>&1

echo [i] list of known docker images:
echo

docker images

