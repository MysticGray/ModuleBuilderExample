#Region '.\Private\Invoke-HelloWorldPrivate.ps1' 0
function Invoke-HelloWorldPrivate {

     return "Hello World - Private"
}

#EndRegion '.\Private\Invoke-HelloWorldPrivate.ps1' 5
#Region '.\Public\Invoke-HelloWorld.ps1' 0
function Invoke-HelloWorld {

    Write-Output "Hello World - Public"
    Write-Output (Invoke-HelloWorldPrivate)
}

#EndRegion '.\Public\Invoke-HelloWorld.ps1' 6
