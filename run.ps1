$imageVersionTag = . .\scripts\Get-ImageVersionTag.ps1 (Join-Path $PSScriptRoot NAVDVD)

$shareParameter = ""
if (Test-Path $sharePath) {
    $shareParameter = " -v ${sharePath}:c:\share"
}

start-process 'docker.exe' -argumentList "run$shareParameter $imageVersionTag"
