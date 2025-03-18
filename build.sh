#!/usr/bin/env bash
set -euo pipefail

rm -rf nuget
mkdir nuget

dotnet tool restore

pushd ./src/root/Storage
run: dotnet build --configuration Debug --no-restore
popd

pushd ./src/root/IdentityServer4
run: dotnet build --configuration Debug --no-restore
popd

pushd ./src/root/EntityFramework.Storage
run: dotnet build --configuration Debug --no-restore
popd

pushd ./src/root/EntityFramework
run: dotnet build --configuration Debug --no-restore
popd

pushd ./src/root/AspNetIdentity
run: dotnet build --configuration Debug --no-restore
popd
