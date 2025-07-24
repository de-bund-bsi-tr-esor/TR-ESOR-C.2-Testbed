rem TS_NAME and TC_NAME parameters are required

echo [I] akt. TS_NAME: [!TS_NAME!]
echo [I] akt. TC_NAME: [!TC_NAME!]

set TS_REPORTS_DIR=%TEST_REPORTS_DIR%\%TS_NAME%

set TC_REPORTS_DIR=%TS_REPORTS_DIR%\%TC_NAME%

if not exist %TC_REPORTS_DIR% (
	mkdir %TC_REPORTS_DIR%
)

echo [I] %TST_RUNNER% -s!TS_NAME! -c!TC_NAME! -r -a -j -J -f%TC_REPORTS_DIR% -I -i %TESTBED_HOME%\%TEST_PROJECT_FILE_NAME%
call %TST_RUNNER% -s!TS_NAME! -c!TC_NAME! -r -a -j -J -f!TC_REPORTS_DIR! -I -i %TESTBED_HOME%\%TEST_PROJECT_FILE_NAME%