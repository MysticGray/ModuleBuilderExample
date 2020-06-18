$modulePath = Split-Path ($MyInvocation.MyCommand).Path -Parent
$moduleName = ($modulePath).Split("\") |
               Select-Object -Last 1
Write-Host "Bulding Module - $moduleName"
if (Get-Module $moduleName) {
    $version = (Get-Module $moduleName).Version.ToString()    
    Write-Host "Removing: Module: $moduleName Version: $version"
    Remove-Module $moduleName
}
Write-Host "Building Module: $moduleName"
Set-Location "$modulePath\source"
Build-Module -PublicFilter "Public\*.ps1" -Verbose              
Write-Host "Importing Module: $moduleName"
Import-Module "$modulePath\Output\$moduleName.psd1"
Set-Location "$modulePath"
return Get-Module $moduleName