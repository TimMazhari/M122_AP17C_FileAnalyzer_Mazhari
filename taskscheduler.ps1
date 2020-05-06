<#
.DESCRIPTION
   Functions to create, check and delete a scheduled task
.AUTHOR
    Mazhari Tim
#>


function Create-TaskScheduler {
    #Create a task that runs every minute after first started. 
    $path = $PSScriptRoot + "\folder_sort_service.ps1"
    $scriptpath = $path
    $argument = "-Command `"& $scriptpath`""
    #Execute powershell.exe and run the given service.ps1 file
    $action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument $argument
    $repeat = (New-TimeSpan -Minutes 1)
    $trigger = New-JobTrigger -Once -At (Get-Date).Date -RepeatIndefinitely -RepetitionInterval $repeat
    $task = New-ScheduledTask -Action $action -Trigger $trigger
    Register-ScheduledTask "FileAnalyzerAndSorter" -InputObject $task -Force
}

function Exists-ScheduledTask {
    #Check if task already exists
    Return Get-ScheduledTask | Where-Object {$_.TaskName -like "FileAnalyzerAndSorter" }
}

function Unregister-ScheduledSorter {
    #Remove task
    Unregister-ScheduledTask -TaskName "FileAnalyzerAndSorter" -Confirm:$false
}