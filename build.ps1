## bootstraping for our module. 
## Runs tests, and if they pass, we build the module

$modulePath = Split-Path ($MyInvocation.MyCommand).Path -Parent
$moduleName = ($modulePath).Split("\") |
               Select-Object -Last 1

if ($semver = gitversion -showvariable SemVer) {
    $null = $PSBoundParameters.Add("SemVer", $SemVer)
}

$null =  $PSBoundParameters.Add("PublicFilter", "Public\*.ps1")

Write-Verbose "Checking for Module - $moduleName"
if (Get-Module $moduleName) {
    $version = (Get-Module $moduleName).Version.ToString()    
    Write-Verbose "Removing: Module: $moduleName Version: $version"
    Remove-Module $moduleName
}

Write-Verbose "Building Module: $moduleName"
Set-Location "$modulePath\source"
Build-Module @PSBoundParameters           
Write-Verbose "Importing Module: $moduleName"
Import-Module "$modulePath\Output\$moduleName.psd1"
Set-Location "$modulePath"

Write-Host "Running Our tests"
if ($testFiles = Get-ChildItem "$modulePath\source\Tests\*.Tests.ps1") {
Write-Verbose "$($testFiles.Count) tests found"
Invoke-Pester "$modulePath\source\Tests\*.Tests.ps1" -Output Detailed
} else {
Write-Verbose "No tests found"    
}
