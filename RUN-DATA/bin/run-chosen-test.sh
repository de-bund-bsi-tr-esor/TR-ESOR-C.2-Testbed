#!/bin/bash

source ./env

export TS_NAME=
export TC_NAME=
export ERR_MSG=

function usage() {
	echo ""
	echo "run-chosen-test.sh -s [test-suite-name] -t [test-case-name] -h"
	echo "  -h     - print this help info"
	echo "  -s     - the name of the test suite to be tested"
	echo "  -c     - the name of the test case to be tested"
	echo ""
}

function error() {
	echo ""
	echo "[ERR]: $1 !"
}

while getopts 'hs:c::' opt; do
	case "$opt" in
		s)
			#echo "processing TS with value ${OPTARG}"
			TS_NAME=${OPTARG}
			;;
			
		c)
			#echo "processing TC with value ${OPTARG}"
			TC_NAME=${OPTARG}
			;;
			
		h)
			usage
			exit 0
			;;
			
		*)
			# argument is missing
			error "Required parameter is missing"
			usage
			exit 1
			;;
			
		?)
			# invalid option
			error "Invalid command option"
			usage
			exit 1
			;;
	esac
done

if [[ -z ${TS_NAME} ]]; then
	error "The TS_NAME variable is unset or empty"
	exit 1
fi

if [[ -z ${TC_NAME} ]]; then
	source test-TS.sh
else
	source test-TC.sh
fi