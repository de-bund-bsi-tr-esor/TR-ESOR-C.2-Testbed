@setlocal
@echo off

echo [i] current status of the testbed
echo:
echo [i] current status of docker images:
echo:
docker images
echo:
echo [i] current status of all known docker containers:
echo:
docker ps -a
echo:

endlocal