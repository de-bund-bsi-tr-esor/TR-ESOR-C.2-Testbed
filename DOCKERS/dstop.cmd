@setlocal
@echo off

echo [i] stop the both containers: xsv-srv and erv-srv

docker stop xsv-srv

docker stop erv-srv

echo [i]current status of running container:
echo:
docker ps
echo:

endlocal