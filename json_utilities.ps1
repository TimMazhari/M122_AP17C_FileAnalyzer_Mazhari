<#
.DESCRIPTION
   Multiple json utilities
.AUTHOR
    Mazhari Tim
#>

# Create PSCustomObject containing the folder data that will go into json
Function Create-JsonFolderObject {

    param(
        [string] $name,
        [string] $path,
        [System.Collections.ArrayList] $rules = @()
    )

    Return [PSCustomObject]@{Name = $name; Path = $path; Rules = $rules}
}

# Create PSCustomObject containing the rule data that will go into json
Function Create-FolderTypesObject {

    param(
        [string] $fileType,
        [int] $minsize,
        [int] $maxsize,
        [string] $destination 
    )
    Return [PSCustomObject]@{Filetype = $fileType; Minsize = $minsize; Maxsize = $maxsize; Destination = $destination}
}

# save values to json file
Function Save-AsJson{
    param (
        $json_cobject
    )
    $path = $PSScriptRoot + "\monitored_folders.json"
    ConvertTo-Json($json_cobject) -Depth 3 | Set-Content -Path $path
}

# get values from json
function Convert-FromJson {
    $path = $PSScriptRoot + "\monitored_folders.json"
    return Get-Content  $path| ConvertFrom-Json
}