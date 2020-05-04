Function Create-FolderSorterJob {
    Start-ThreadJob -Name FolderSortJob -ScriptBlock({
    
            Import-Module C:\sources\school\modul122\M122_AP17C_FileAnalyzer_Mazhari\utilities\json_utilities.ps1
            $folders = Convert-FromJson
            foreach($folder in $folders){
               Write-Host($folder)
                [System.Collections.ArrayList] $allFilesInSource = Get-ChildItem -Path $folder.Path
                $allFileNamesInSource = Get-ChildItem -Path $folder.Path -Name
                foreach($file in $allFilesInSource){
                    foreach($rule in $folder.Rules){
                        if($rule.Filetype -eq $file.Extension.ToString()){
                            Move-Item -Path $file -Destination $rule.Destination
                        }
                    }
                }
            }
        
    })
}