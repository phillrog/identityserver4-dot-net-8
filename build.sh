#!/usr/bin/env bash
set -euo pipefail

rm -rf nuget
mkdir nuget

dotnet restore

pushd ./src/root/Storage
dotnet build --configuration Debug 
popd

pushd ./src/root/IdentityServer4
dotnet build --configuration Debug 
popd

pushd ./src/root/EntityFramework.Storage
dotnet build --configuration Debug 
popd

pushd ./src/root/EntityFramework
dotnet build --configuration Debug 
popd

pushd ./src/root/AspNetIdentity
dotnet build --configuration Debug 
popd
