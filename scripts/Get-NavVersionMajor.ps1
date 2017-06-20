param (
    [Parameter(Mandatory=$true)]
    [string]$navDvdPath
)

if ([System.IO.Path]::IsPathRooted($navDvdPath) -eq $false) {
    $navDvdPath = Join-Path $currDir $navDvdPath
}

$navVersion = Get-ChildItem -Path $navDvdPath -Filter setup.exe | Select-Object -First 1 | ForEach-Object { $_.VersionInfo.FileMajorPart }

if (!$navVersion) {
    Write-Error "NAVDVD folder not present - cannot build the image without NAVDVD folder"
    exit
}

return $navVersion