@setlocal
@echo off

echo [i] removing all container and all images
echo:

call .\dclean-container.cmd

docker rmi xsv-srv:1.0.0 > NUL 2>&1

docker rmi erv-srv:1.0.0 > NUL 2>&1

docker rmi alpine-j11:1.0.0 > NUL 2>&1

echo [i] list of known images:
echo:
docker images

endlocal