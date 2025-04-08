@setlocal EnableDelayedExpansion
@echo off

echo [I] Delete all evaluation summaries.

call .\env.cmd

pushd %TEST_RUN_EVAL_DIR%
rmdir /S /Q . >nul 2>&1
popd

endlocal