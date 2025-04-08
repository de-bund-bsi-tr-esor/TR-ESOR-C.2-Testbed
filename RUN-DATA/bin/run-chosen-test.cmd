@setlocal EnableDelayedExpansion
@echo off 

call env.cmd

set TS_NAME=
set TC_NAME=
set ERR_MSG=

:GETOPTS
if /I "%1" == "-h" goto HELP
if /I "%1" == "-TS" (
	if \\%2\\ == \\\\ goto INVALID_OPTS
	set TS_NAME=%2
	shift & shift
	goto GETOPTS
)
if /I "%1" == "-TC" ( 
	if \\%2\\ == \\\\ goto INVALID_OPTS
	set TC_NAME=%2
	shift & shift
	goto GETOPTS
)	

rem no parameters
if \\!TC_NAME!\\ == \\\\ (
	if \\!TS_NAME!\\ == \\\\ (
		set ERR_MSG='No parameters have been specified!'
		goto INVALID_OPTS
	)
)

rem TC aber no TS
if not \\!TC_NAME!\\ == \\\\ (
	if \\!TS_NAME!\\ == \\\\ (
		set ERR_MSG='Specified a test case but test suite is missing!'
		goto INVALID_OPTS
	)
	goto TEST_CASE
)
rem only TS		
goto TEST_SUITE


:TEST_SUITE
echo [I] testing the test suite: %TS_NAME%
call .\test-TS.cmd
goto THE_END

:TEST_CASE
echo [I] testing the test case: %TC_NAME% in test duite: %TS_NAME%
call .\test-TC.cmd
goto THE_END


:INVALID_OPTS
echo [E] No or invalid input parameters found!
if not \\!ERR_MSG!\\ == \\\\ echo [E] %ERR_MSG%
goto HELP

:HELP
echo run-chosen-test.cmd -TS [test-suite-name] -TC [test-case-name]
echo 	-h	- print this help info
echo 	-TS	- the name of the test suite to be tested
echo 	-TC	- the name of the test case to be tested
goto THE_END

:THE_END

@endlocal