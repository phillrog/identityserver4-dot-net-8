#!/usr/bin/env bash

rm -rf nuget
mkdir nuget

dotnet restore

pushd ./src
dotnet build IdentityServer4.Clients.sln  --configuration Release --no-restore;    
popd
