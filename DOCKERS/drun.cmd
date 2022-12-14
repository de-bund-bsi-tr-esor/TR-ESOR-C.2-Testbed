@setlocal
@echo off

echo [i] running the needed container: xsv-srv and erv-srv
echo:

call .\xsv-srv\drun.cmd
start "xsv-srv log" docker logs -f xsv-srv

call .\erv-srv\drun.cmd
start "erv-srv log" docker logs -f erv-srv

echo [i] status of container:
echo:
docker ps

endlocal