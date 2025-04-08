#!/bin/bash

echo "[INF]: Test all test cases of all test suites in one run as project."

source ./env

echo "[INF]: Executing: ${TST_RUNNER} -r -a -j -J -f${TEST_REPORTS_DIR} -I -i ${TESTBED_HOME}/${TEST_PROJECT_FILE_NAME}"

"${TST_RUNNER}" -r -a -j -J -f"${TEST_REPORTS_DIR}" -I -i "${TESTBED_HOME}"/"${TEST_PROJECT_FILE_NAME}"