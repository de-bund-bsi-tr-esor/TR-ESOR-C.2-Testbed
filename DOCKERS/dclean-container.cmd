@setlocal
@echo off

echo [i] removing the container: xsv-srv and erv-srv, if existing
echo:

docker rm xsv-srv > NUL 2>&1

docker rm erv-srv > NUL 2>&1

echo [i] list of known container:
echo:

docker ps -a

endlocal