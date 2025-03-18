#!/usr/bin/env bash

rm -rf nuget
mkdir nuget
cd .src/clients

for p in $(find . -name *.csproj); 
do 
    pushd ./$(cut -d'/' -f2 <<<"$p")
    dotnet restore
    dotnet build $p  --configuration Release --no-restore; 
    popd
done
