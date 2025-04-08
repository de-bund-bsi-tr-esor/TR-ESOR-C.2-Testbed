#!/bin/bash

# S_NAME and TC_NAME parameters are required

echo "[INF]: akt. TS_NAME: ${TS_NAME}"
echo "[INF]: akt. TC_NAME: ${TC_NAME}"

export TS_REPORTS_DIR="${TEST_REPORTS_DIR}"/"${TS_NAME}"
export TC_REPORTS_DIR="${TS_REPORTS_DIR}/${TC_NAME}"

if [ ! -d "${TC_REPORTS_DIR}" ]; then
	if [ ! -L "${TC_REPORTS_DIR}" ]; then
		mkdir -p "${TC_REPORTS_DIR}"
	fi
fi

echo "[INF]: Executing: $TST_RUNNER -s${TS_NAME} -c${TC_NAME} -r -a -j -J -f${TC_REPORTS_DIR} -I -i ${TESTBED_HOME}/${TEST_PROJECT_FILE_NAME}"

"$TST_RUNNER" -s"${TS_NAME}" -c"${TC_NAME}" -r -a -j -J -f"${TC_REPORTS_DIR}" -I -i "${TESTBED_HOME}"/"${TEST_PROJECT_FILE_NAME}"