
function onStart() {
    
    $folders = Get-Content "C:\sources\school\modul122\M122_AP17C_FileAnalyzer_Mazhari\monitored_folders.json" | ConvertFrom-Json
    
    foreach($folder in $folders){
        [System.Collections.ArrayList] $allFilesInSource = Get-ChildItem -Path $folder.Path
        foreach($file in $allFilesInSource){
            foreach($rule in $folder.Rules){
                if($rule.Filetype -eq $file.Extension.ToString()){
                    Move-Item -Path ($folder.Path + "\" + $file.Name) -Destination $rule.Destination
                }
            }
        }
    }
}

function onStop(){

} 