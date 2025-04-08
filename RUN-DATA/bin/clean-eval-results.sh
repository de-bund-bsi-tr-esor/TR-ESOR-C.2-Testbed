#!/bin/bash

source ./env

# Change to the test run evaluation directory
cd "$TEST_RUN_EVAL_DIR" || exit 1

# Remove all files and directories inside
rm -rf ./* > /dev/null 2>&1

# Return to the previous directory
cd - > /dev/null 2>&1
