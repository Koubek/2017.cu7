$imageVersionTag = . (Join-Path $PSScriptRoot "scripts\Get-ImageVersionTag.ps1") (Join-Path $PSScriptRoot NAVDVD)

docker build -t $imageVersionTag $PSScriptRoot
