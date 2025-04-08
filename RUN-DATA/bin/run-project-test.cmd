@setlocal EnableDelayedExpansion
@echo off

echo [I] Test all test cases of all test suites in one run as project.

call .\env.cmd

call %TST_RUNNER% -r -a -j -J -f%TEST_REPORTS_DIR% -I -i %TESTBED_HOME%\%TEST_PROJECT_FILE_NAME%

endlocal