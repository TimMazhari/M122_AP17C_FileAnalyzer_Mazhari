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
    #Loop through each folder in all the folders that should be monitored
    foreach($folder in $jsonFolders){
        #Get all the files in said folder
        $allFilesInSource = Get-ChildItem -Path $folder.Path
        #Loop through all the files in folder
        foreach($file in $allFilesInSource){
            #Go through all the rules of the current folder
            foreach($rule in $folder.Rules){
                #Check if the extension of the current file is equal to the extension of a rule. If so, we maybe have to move the file
                if($rule.Filetype -eq $file.Extension.ToString()){
                    #If minsize and maxsize are both 0, we ignore them and just move all the files.
                    if(($rule.MinSize -eq 0) -and ($rule.MaxSize -eq 0)){
                        #Move the item from given path to the wanted destination
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