@setlocal
@echo off

echo [i] current status of the testbed
echo:
echo current status of images:
echo:
docker images
echo:
echo [i] current status of container:
echo:
docker ps -a
echo:

endlocal