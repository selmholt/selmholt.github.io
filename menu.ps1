function Show-Menu {
     param (
          [string]$Title = 'My Menu'
     )
     Clear-Host
     Write-Host " ================ $Title ================ "
    
     Write-Host " 1: Press '1' for this option. "
     Write-Host " 2: Press '2' for this option. "
     Write-Host " 3: Press '3' for this option. "
     Write-Host " Q: Press 'Q' to quit. "
}

Set-ExecutionPolicy Bypass -Scope Process
$WorkingDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

do {
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input) {
          '1' {
               Clear-Host
               'You chose option #1'
               Write-host "$WorkingDir"
          } '2' {
               Clear-Host
               'You chose option #2'
          } '3' {
               Clear-Host
               'You chose option #3'
          } 'q' {
               return
          }
     }
     pause
}
until ($input -eq 'q')
