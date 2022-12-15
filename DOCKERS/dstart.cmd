@setlocal
echo off

echo [i] starting all needed docker containers: xsv-srv and erv-srv
echo:

call .\xsv-srv\dstart.cmd

call .\erv-srv\dstart.cmd

echo [i] status of the runing docker containers:
echo:
docker ps
echo:

endlocal