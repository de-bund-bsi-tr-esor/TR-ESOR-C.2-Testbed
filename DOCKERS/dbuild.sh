#!/bin/sh

echo [i] building all needed docker images
echo

cd ./alpine-oj11
./dbuild.sh
cd ..

cd ./xsv-srv
./dbuild.sh
cd ..

cd ./erv-srv
./dbuild.sh
cd ..

echo
echo [i] list of known containers:
echo

docker images

