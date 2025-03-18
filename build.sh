#!/usr/bin/env bash
set -euo pipefail

rm -rf nuget
mkdir nuget

dotnet tool restore

pushd ./src/root/Storage
ls ../../../
ls ../../
ls ../
../../../build.cmd "$@"
popd

pushd ./src/root/IdentityServer4
./build.cmd "$@"
popd

pushd ./src/root/EntityFramework.Storage
./build.cmd "$@"
popd

pushd ./src/root/EntityFramework
./build.cmd "$@"
popd

pushd ./src/root/AspNetIdentity
./build.cmd "$@"
popd
