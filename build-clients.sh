#!/usr/bin/env bash
set -euo pipefail
rm -rf nuget
mkdir nuget
cd ./src/clients

for p in $(find . -name *.csproj); 
do 
    dir=$(cut -d'/' -f2 <<<"$p")
    proj=$(cut -d'/' -f3 <<<"$p")
    if [[ $dir == *"APIs"* ]]; then 
        dir=APIs/$(cut -d'/' -f3 <<<"$p"); 
        proj=$(cut -d'/' -f4 <<<"$p")
    fi
    pushd ./$dir
    dotnet restore
    dotnet build $proj  --configuration Release --no-restore; 
    popd
done
