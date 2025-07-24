@setlocal EnableDelayedExpansion
@echo off

echo [I] Try to delete all evaluation summaries.

call .\env.cmd

IF EXIST %TEST_RUN_EVAL_DIR% (
	rmdir /S /Q %TEST_RUN_EVAL_DIR% >nul 2>&1
	echo [I] ... DONE!
) ELSE (
	echo [I] ... there were no summaries to be deleted!
)

endlocal