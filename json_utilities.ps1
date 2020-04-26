Function Create-JsonFolderObject {

    param(
        [string] $name,
        [string] $path
    )

    Return [PSCustomObject]@{Name = $name; Path = $path}
}

Function Save-AsJson{
    param (
        $json_cobject
    )
    ConvertTo-Json($json_cobject) | Set-Content -Path "C:\sources\school\modul122\M122_AP17C_FileAnalyzer_Mazhari\monitored_folders.json"
}

function Convert-FromJson {
    return Get-Content "C:\sources\school\modul122\M122_AP17C_FileAnalyzer_Mazhari\monitored_folders.json" | ConvertFrom-Json
}