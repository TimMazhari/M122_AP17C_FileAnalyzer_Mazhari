function Sort-Folders {
    $jsonFilePath = $PSScriptRoot + "\monitored_folders.json"
    [System.Collections.ArrayList] $jsonFolders = Get-Content $jsonFilePath | ConvertFrom-Json
    foreach($folder in $jsonFolders){
        $allFilesInSource = Get-ChildItem -Path $folder.Path
        foreach($file in $allFilesInSource){
            foreach($rule in $folder.Rules){
                if($rule.Filetype -eq $file.Extension.ToString()){
                    Move-Item -Path ($folder.Path + "\" + $file.Name) -Destination $rule.Destination 
                    Write-Host $folder.Path + "" + $file.Name + " moved to " + $rule.Destination                   
                }
            }
        }
    }
}

Sort-Folders