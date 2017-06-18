$version = (Split-Path $PSScriptRoot -Leaf).Replace('.',':')
$sharePath = Join-Path $PSScriptRoot 'Share'
start-process 'docker.exe' -argumentList "run -v ${sharePath}:c:\share navdocker.azurecr.io/nav/$version"
