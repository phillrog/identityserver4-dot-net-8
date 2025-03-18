#!/usr/bin/env bash
set -euo pipefail

rm -rf nuget
mkdir nuget

dotnet tool restore

pushd ./src/root/Storage
./build.sh "$@"
popd

pushd ./src/root/IdentityServer4
./build.sh "$@"
popd

pushd ./src/root/EntityFramework.Storage
./build.sh "$@"
popd

pushd ./src/root/EntityFramework
./build.sh "$@"
popd

pushd ./src/root/AspNetIdentity
./build.sh "$@"
popd
