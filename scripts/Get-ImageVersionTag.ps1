param (
    [Parameter(Mandatory=$true)]
    [string]$navDvdPath
)

$navVersion = Get-ChildItem -Path $navDvdPath -Filter "Microsoft.Dynamics.Nav.Server.exe" -recurse | Select-Object -First 1 | ForEach-Object { $_.VersionInfo.FileVersion }

if (!$navVersion) {
    throw "NAVDVD folder not present - cannot build the image without NAVDVD folder"
}

$langTags = "W1"
$langMasterDirName = 'Installers'
$serviceDirName = 'Server'

$langMasterDirPath = Join-Path $navDvdPath $langMasterDirName
if (Test-Path $langMasterDirPath) {
    $langDirs = Get-ChildItem -Path $langMasterDirPath | Where-Object {$_.FullName -match "\b\w{2}\b"}
    
    if (($langDirs | Measure-Object).Count -gt 0) {
    
        $langTags = ""
    
        foreach ($dir in $langDirs) {
    
            if (![System.String]::IsNullOrEmpty($langTags)) {
                $langTags += ":"
            }
            
            $langTags += $dir.Name
        }
    }
}

return "nav${navVersion}:${langTags}"
