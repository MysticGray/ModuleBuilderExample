function Invoke-HelloWorld {

    Write-Output "Hello World - Public"
    Write-Output (Invoke-HelloWorldPrivate)
}

