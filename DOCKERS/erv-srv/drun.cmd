@setlocal
@echo off

set MY_HOME=%~dp0

docker run -d -p 9090:9090 --name erv-srv -h erv-srv -v %MY_HOME%\lxaip:/opt/lxaip erv-srv:1.0.0

@endlocal