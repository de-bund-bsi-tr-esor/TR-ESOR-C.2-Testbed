#!/bin/bash

# TS_NAME input parameter is needed

echo "[INF]: akt. TS_NAME: ${TS_NAME}"

export TS_REPORTS_DIR="${TEST_REPORTS_DIR}"/"${TS_NAME}"

if [ ! -d "$TS_REPORTS_DIR" ]; then
	if [ ! -L "$TS_REPORTS_DIR" ]; then
		rmdir -p "$TS_REPORTS_DIR"
	fi
fi

echo "[INF]: Executing: $TST_RUNNER -s${TS_NAME} -r -a -j -J -f${TS_REPORTS_DIR} -I -i ${TESTBED_HOME}/${TEST_PROJECT_FILE_NAME}"

"$TST_RUNNER" -s"${TS_NAME}" -r -a -j -J -f"${TS_REPORTS_DIR}" -I -i "${TESTBED_HOME}"/"${TEST_PROJECT_FILE_NAME}"