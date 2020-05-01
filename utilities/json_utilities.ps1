Function Create-JsonFolderObject {

    param(
        [string] $name,
        [string] $path,
        [System.Collections.ArrayList] $rules = @()
    )

    Return [PSCustomObject]@{Name = $name; Path = $path; Rules = $rules}
}

Function Create-FolderTypesObject {

    param(
        [string] $fileType,
        [int] $minsize,
        [int] $maxsize,
        [string] $destination 
    )
    Return [PSCustomObject]@{Filetype = $fileType; Minsize = $minsize; Maxsize = $maxsize; Destination = $destination}
}
Function Save-AsJson{
    param (
        $json_cobject
    )
    ConvertTo-Json($json_cobject) -Depth 3 | Set-Content -Path "C:\sources\school\modul122\M122_AP17C_FileAnalyzer_Mazhari\monitored_folders.json"
}

function Convert-FromJson {
    return Get-Content "C:\sources\school\modul122\M122_AP17C_FileAnalyzer_Mazhari\monitored_folders.json" | ConvertFrom-Json
}