throw "Do not run script!"

# Remove generic containers
$version = (Split-Path $PSScriptRoot -Leaf).Replace('.',':')
Get-ContainerImage | Where-Object { $_.RepoTags.Count -eq 1 -and $_.RepoTags[0] -eq "navdocker.azurecr.io/nav/$version" } | % {
    Write-Host $_.ID
    $img = $_
    Get-Container | Where-Object { $_.ImageID -eq $img.ID } | Remove-Container -Force
    # Leave generic container image
    #Remove-ContainerImage -ImageIdOrName $img.ID -Force
}
