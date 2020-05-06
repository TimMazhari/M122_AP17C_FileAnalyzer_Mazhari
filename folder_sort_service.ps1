#Code that actually
<#
.DESCRIPTION
   Code that will be called by the scheduledtask
.AUTHOR
    Mazhari Tim
#>


#Code that actually moves files around
function Sort-Folders {
    $path = $PSScriptRoot + "\monitored_folders.json"
    $jsonFilePath = $path
    [System.Collections.ArrayList] $jsonFolders = Get-Content $jsonFilePath | ConvertFrom-Json
    foreach($folder in $jsonFolders){
        $allFilesInSource = Get-ChildItem -Path $folder.Path
        foreach($file in $allFilesInSource){
            foreach($rule in $folder.Rules){
                if($rule.Filetype -eq $file.Extension.ToString()){
                    #If minsize and maxsize are both 0, we ignore them and just move all the files.
                    if(($rule.MinSize -eq 0) -and ($rule.MaxSize -eq 0)){
                        Move-Item -Path ($folder.Path + "\" + $file.Name) -Destination $rule.Destination
                    }else{
                        #Otherwise we check if the file is in the respective range and move it accordingly
                        if(($file.length / 1KB -ge $rule.MinSize) -and ($file.length / 1KB -le $rule.MaxSize)){
                            Move-Item -Path ($folder.Path + "\" + $file.Name) -Destination $rule.Destination
                        }
                    }                  
                }
            }
        }
    }
}

Sort-Folders