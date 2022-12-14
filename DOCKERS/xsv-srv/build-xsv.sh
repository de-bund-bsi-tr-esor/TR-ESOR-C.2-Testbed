#!/bin/sh

cd /opt
git clone https://github.com/de-bund-bsi-tr-esor/tr-esor-AIP-eIDAS-SigValidator.git
ln -s tr-esor-AIP-eIDAS-SigValidator xsv
cd xsv 
mvn clean package

  

