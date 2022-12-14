#!/bin/sh

if [ ! -f /opt/.erv-built ]; then
  echo [i] ERVT is not present, get and build one instance
  /opt/build-erv.sh
  touch /opt/.erv-built
fi

echo [i] starting ERV on port $ERV_PORT und with config $ERV_CONF, $ERV_HOME

$ERV_BIN/checktool -server -host $ERV_HOST -port $ERV_PORT -conf $ERV_CONF

  

