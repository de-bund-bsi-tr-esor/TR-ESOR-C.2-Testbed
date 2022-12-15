@setlocal
@echo off

echo [i] building all needed docker images
echo:

pushd .\alpine-oj11\
call dbuild.cmd
popd

pushd .\xsv-srv\
call dbuild.cmd
popd

pushd .\erv-srv\
call dbuild.cmd
popd

echo:
echo [i] list of known docker containers:
echo:
docker images

endlocal