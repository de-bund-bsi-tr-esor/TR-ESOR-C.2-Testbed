rem TS_NAME input parameter is needed

echo [I] akt. TS_NAME: [!TS_NAME!]

set TS_REPORTS_DIR=%TEST_REPORTS_DIR%\%TS_NAME%

if not exist %TS_REPORTS_DIR% (
	mkdir %TS_REPORTS_DIR%
)

call %TST_RUNNER% -s%TS_NAME%  -r -a -j -J -f%TS_REPORTS_DIR% -I -i %TESTBED_HOME%\%TEST_PROJECT_FILE_NAME%