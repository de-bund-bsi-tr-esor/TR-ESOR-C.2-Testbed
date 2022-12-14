#!/bin/sh

cd /opt
git clone https://github.com/de-bund-bsi-tr-esor/ERVerifyTool.git
ln -s $ERV_HOME erv
cd $ERV_HOME
./gradlew clean build -Prelease -DskipIntegrationTests


  

