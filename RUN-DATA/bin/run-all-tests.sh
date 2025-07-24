#!/bin/bash

echo "[INF]: Test all test cases of all test suites one after another, in separately started runs."

source ./env

SUITS_FILE="./data/test-suits.txt"

awk '{ sub("\r$", ""); print }' ${SUITS_FILE} > ${SUITS_FILE}.linux

while IFS= read -r VAR1; do
    IFS=":" read -r TS_NAME VAR2 <<< "$VAR1"
    VAR3=./data/${VAR2}
	awk '{ sub("\r$", ""); print }' ${VAR3} > ${VAR3}.linux

    # Check if VAR3 exists before reading
    if [[ ! -f "$VAR3" ]]; then
        echo "Error: File '$VAR3' not found!"
        exit 1
    fi

    while IFS= read -r TC_NAME; do
        export TS_NAME TC_NAME
        source test-TC.sh
    done < "${VAR3}.linux"
	
	rm -f ${VAR3}.linux
	
done < "${SUITS_FILE}.linux"

rm -f ${SUITS_FILE}.linux