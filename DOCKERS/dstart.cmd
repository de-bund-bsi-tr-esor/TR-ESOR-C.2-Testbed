@setlocal
echo off

echo [i] starting all needed container: xsv-srv and erv-srv
echo:

call .\xsv-srv\dstart.cmd

call .\erv-srv\dstart.cmd

echo [i] status of the container:
echo:
docker ps
echo:

endlocal