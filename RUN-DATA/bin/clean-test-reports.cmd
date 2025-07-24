@setlocal EnableDelayedExpansion
@echo off

echo [I] Try to delete all test reports ...

call .\env.cmd

IF EXIST %TEST_REPORTS_DIR% (
	rmdir /S /Q %TEST_REPORTS_DIR% >nul 2>&1
	echo [I] ... DONE!
) ELSE (
	echo [I] ... there were no reports to be deleted!
)

endlocal