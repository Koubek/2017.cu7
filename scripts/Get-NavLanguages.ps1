param (
    [Parameter(Mandatory=$true)]
    [string]$navDvdPath
)

$langTags = "W1"
$langMasterDirName = 'Installers'
$serviceDirName = 'Server'

$langMasterDirPath = Join-Path $navDvdPath $langMasterDirName

if (!(Test-Path $langMasterDirPath)) {
    Write-Host "'"$langMasterDirName"' is missing. Exiting the language installation process."
    exit
}

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

return $langTags