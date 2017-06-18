$version = (Split-Path $PSScriptRoot -Leaf).Replace('.',':')

docker build -t navdocker.azurecr.io/nav/$version .
