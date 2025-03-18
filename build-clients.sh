#!/usr/bin/env bash

rm -rf nuget
mkdir nuget

dotnet restore

pushd ./src/clients
for p in $(find . -name *.csproj); 
do 

    # dotnet build $p  --configuration Release --no-restore; 
    $p
done
popd
