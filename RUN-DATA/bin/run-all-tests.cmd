@setlocal EnableDelayedExpansion
@echo off

echo [I] Test all test cases of all test suites one after another, in separately started runs.

call .\env.cmd

set SUITS_FILE=data\test-suits.txt

for /F "tokens=*" %%X in (!SUITS_FILE!) do (
	set VAR1=%%X
	for /F "tokens=1,2 delims=:" %%A in ("!VAR1!") do (
		set TS_NAME=%%A
		set VAR2=data\%%B
		for /F "tokens=1" %%Y in (!VAR2!) do (
			set TC_NAME=%%Y
			call .\test-TC.cmd
		)
	)
)

endlocal