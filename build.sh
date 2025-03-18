#!/usr/bin/env bash
set -euo pipefail

rm -rf nuget
mkdir nuget

dotnet tool restore

pushd ./src/root/Storage
dotnet build --configuration Debug --no-restore
popd

pushd ./src/root/IdentityServer4
dotnet build --configuration Debug --no-restore
popd

pushd ./src/root/EntityFramework.Storage
dotnet build --configuration Debug --no-restore
popd

pushd ./src/root/EntityFramework
dotnet build --configuration Debug --no-restore
popd

pushd ./src/root/AspNetIdentity
dotnet build --configuration Debug --no-restore
popd
