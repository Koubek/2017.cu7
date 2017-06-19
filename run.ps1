$version = (Split-Path $PSScriptRoot -Leaf).Replace('.',':')
$sharePath = Join-Path $PSScriptRoot 'Share'
$shareParameter = ""
if (Test-Path $sharePath) {
    $shareParameter = " -v ${sharePath}:c:\share"
}
start-process 'docker.exe' -argumentList "run$shareParameter navdocker.azurecr.io/nav/$version"
