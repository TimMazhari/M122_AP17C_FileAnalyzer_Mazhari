function onStart() {
    Start-Job -Name FolderSortJob -ScriptBlock({
            $folders = Get-Content "C:\sources\school\modul122\M122_AP17C_FileAnalyzer_Mazhari\monitored_folders.json" | ConvertFrom-Json
            
            foreach($folder in $folders){
                [System.Collections.ArrayList] $allFilesInSource = Get-ChildItem -Path $folder.Path
                $allFileNamesInSource = Get-ChildItem -Path $folder.Path -Name
                foreach($file in $allFilesInSource){
                    foreach($rule in $folder.Rules){
                        if($rule.Filetype -eq $file.Extension.ToString()){
                            Move-Item -Path ($folder.Path + "\" + $file.Name) -Destination $rule.Destination
                        }
                    }
                }
            }
            
            New-Item -Path "C:\Users\Bim Bababi\Desktop\Neuer Ordner" -Name $file.Name -ItemType "directory"
            sleep(1)
        
    })
    Get-Job | Receive-Job
}

function onStop(){

} 