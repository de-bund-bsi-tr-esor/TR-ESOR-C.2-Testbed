#!/bin/sh

if [ ! -f /opt/.xsv-built ]; then
  echo [i] XSV is not present, get and build one instance
  /opt/build-xsv.sh
  touch /opt/.xsv-built
fi

echo [i] starting XSV as $XSV_HOST:$XSV_PORT

java -cp /opt/xsv/aip-validator-soap/target/aip-validator-soap-$XSV_VERSION.jar:/opt/xsv/aip-validator-soap/target/dependency/* \
    de.bund.bsi.tresor.aip.validator.soap.Server \
    -Mvalidator.schemaDir=$XSV_SCHEMA_DIR \
    -Mverifier.wsdlUrl=$XSV_VER_URL \
    --host $XSV_HOST \
    --port $XSV_PORT

  

