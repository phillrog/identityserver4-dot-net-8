#!/usr/bin/env bash

rm -rf nuget
mkdir nuget

dotnet restore

pushd ./src/
ls ./src
dotnet build ./src/IdentityServer4.Clients.sln  --configuration Release --no-restore;    
popd
