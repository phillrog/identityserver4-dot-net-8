$ErrorActionPreference = "Stop";

New-Item -ItemType Directory -Force -Path ./nuget

dotnet tool restore

pushd ./src/root/Storage
Invoke-Expression "./build.ps1 $args"
popd

pushd ./src/root/IdentityServer4
Invoke-Expression "./build.ps1 $args"
popd

pushd ./src/root/EntityFramework.Storage
Invoke-Expression "./build.ps1 $args"
popd

pushd ./src/root/EntityFramework
Invoke-Expression "./build.ps1 $args"
popd

pushd ./src/root/AspNetIdentity
Invoke-Expression "./build.ps1 $args"
popd
