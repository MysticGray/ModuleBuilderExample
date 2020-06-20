 	
$parentPath = Split-Path ($MyInvocation.MyCommand).Path -Paren
$sourceDir = Split-Path ($parentPath) 
$parentPathSplit = $parentPath.Split("\")
$moduleName =  ($parentPathSplit)[($parentPathSplit.count) - 3]
$exportedCommands = ((get-module $modulename).ExportedCommands).values.name 

Describe 'Module Build' {
    $pubicTestCases = @{
        publicCommands = (Get-ChildItem "$sourceDir\Public").name -replace ".ps1",""
        exportedCommands = $exportedCommands
    }

    $privateTestCases = @{
        privateCommands = (Get-ChildItem "$sourceDir\Private").name -replace ".ps1",""
        exportedCommands = $exportedCommands
    }

    It 'All Functions in Public Folder should be exported' -TestCases $pubicTestCases {
        param($publicCommands, $exportedCommands)
        $publicCommands | Should -Be ($exportedCommands) 
    }
    It 'All Functions in Private Folder should not exported' -TestCases $privateTestCases {
        param($privateCommands, $exportedCommands)
        $privateCommands | foreach-Object {
            $_ | Should -Not -BeIn ($exportedCommands) 
        }
    }
    It 'All Functions should match file names' {
        Invoke-HelloWorld | Should -Be "Hello World"
    }
    It 'Module Version Should Match Git Repo' {
        if ($semver = gitversion -showvariable SemVer) {
            $semver | Should -Be (get-module $modulename).version.ToString()
        }
    }
  }
