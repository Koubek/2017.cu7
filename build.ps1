$version = . .\scripts\Get-NavVersionMajor.ps1 (Join-Path $PSScriptRoot NAVDVD)
$langTag = . .\scripts\Get-NavLanguages.ps1 (Join-Path $PSScriptRoot NAVDVD)

$version
$langTag

$repoImageVersionTag = "navdocker.azurecr.io/nav/" + $version + ":" + $langTag

docker build -t $repoImageVersionTag $PSScriptRoot
