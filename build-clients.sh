#!/usr/bin/env bash
set -euo pipefail

rm -rf nuget
mkdir nuget

cd ./src/clients

for p in $(find . -name *.csproj); 
do 
    dotnet build $p  --configuration Release --no-restore;    
done
