function Show-Menu {
     param (
          [string]$Title = 'My Menu'
     )
     Clear-Host
     Write-Host " ================ $Title ================ "
    
     Write-Host " 1: Get-WindowsAutoPilotInfo "
     Write-Host " 2: Press '2' for this option. "
     Write-Host " 3: Press '3' for this option. "
     Write-Host " Q: Press 'Q' to quit. "
}

Set-ExecutionPolicy Bypass -Scope Process

$TempDir = $env:TEMP
$CloudFilesDir = Join-Path -Path $TempDir -ChildPath 'CloudFiles'
if (-not (Test-Path -Path $CloudFilesDir)) {
     New-Item -ItemType Directory -Path $CloudFilesDir | Out-Null
}

$Root = Get-Location
Set-Location -Path $CloudFilesDir

do {
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input) {
          '1' {
               Clear-Host
                  'You chose option #1'
                  Install-Script -Name Get-WindowsAutoPilotInfo -Force
          } '2' {
               Clear-Host
               'You chose option #2'
          } '3' {
               Clear-Host
               'You chose option #3'
          } 'q' {
               Set-Location -Path $Root
               Remove-Item -Path $CloudFilesDir -Recurse -Force
               return
          }
     }
     pause
}
until ($input -eq 'q')
