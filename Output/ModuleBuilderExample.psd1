@{

# Script module or binary module file associated with this manifest.
# Version number of this module.
ModuleVersion = '0.1.0'
GUID = '748782a1-9c9b-4a0b-a355-b57edef5d8f2'
RootModule  = 'ModuleBuilderExample.psm1'

Author = 'Scott'
CompanyName = 'Scott Gray'
Copyright = '(c) 2020 Scott Gray. All rights reserved.'
Description = 'This is a sample module which uses ModuleBuilder, Pester and git. '
RequiredModules = @('Pester','Configuration')
FunctionsToExport = @('Invoke-GoodbyeWorld','Invoke-HelloWorld')
CmdletsToExport = @()
VariablesToExport = '*'
AliasesToExport = @()
PrivateData = @{

    PSData = @{

        Prerelease     = ''
        ReleaseNotes = ''

    } # End of PSData 

} # End of PrivateData 

}




