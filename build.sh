#!/usr/bin/env bash
set -euo pipefail

rm -rf nuget
mkdir nuget

dotnet tool restore

pushd ./src/root/Storage
dotnet restore
dotnet build --configuration Debug 
popd

pushd ./src/root/IdentityServer4
dotnet restore
dotnet build --configuration Debug 
popd

pushd ./src/root/EntityFramework.Storage
dotnet restore
dotnet build --configuration Debug 
popd

pushd ./src/root/EntityFramework
dotnet restore
dotnet build --configuration Debug 
popd

pushd ./src/root/AspNetIdentity
dotnet restore
dotnet build --configuration Debug 
popd
