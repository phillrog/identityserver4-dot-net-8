#!/usr/bin/env bash
set -euo pipefail

rm -rf nuget
mkdir nuget

dotnet restore
dotnet build ./src/IdentityServer4.Clients.sln  --configuration Release --no-restore;    

