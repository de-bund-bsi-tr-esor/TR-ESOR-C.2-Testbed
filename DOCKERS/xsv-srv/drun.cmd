@setlocal
@echo off

set MY_HOME=%~dp0

docker run -d -p 19090:19090 --name xsv-srv -h xsv-srv -v %MY_HOME%\lxaip:/opt/lxaip xsv-srv:1.0.0

@endlocal