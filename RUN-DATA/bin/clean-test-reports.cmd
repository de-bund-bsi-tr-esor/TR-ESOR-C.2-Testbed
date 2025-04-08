@setlocal EnableDelayedExpansion
@echo off

echo [I] Delete all test reports.

call .\env.cmd

pushd %TEST_REPORTS_DIR%
rmdir /S /Q . >nul 2>&1
popd

endlocal