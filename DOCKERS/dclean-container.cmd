@setlocal
@echo off

echo [i] removing the following docker containers: xsv-srv and erv-srv, if existing
echo:

docker rm xsv-srv > NUL 2>&1

docker rm erv-srv > NUL 2>&1

echo [i] list of known docker containers:
echo:

docker ps -a

endlocal