function Create-TaskScheduler {
    
    $scriptpath = $PSScriptRoot + "\folder_sort_service.ps1"
    $argument = "-Command `"& $scriptpath`""
    $action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument $argument
    $repeat = (New-TimeSpan -Minutes 1)
    $trigger = New-JobTrigger -Once -At (Get-Date).Date -RepeatIndefinitely -RepetitionInterval $repeat
    $task = New-ScheduledTask -Action $action -Trigger $trigger
    Register-ScheduledTask "FileAnalyzerAndSorter" -InputObject $task -Force
}

function Exists-ScheduledTask {
    Return Get-ScheduledTask | Where-Object {$_.TaskName -like "FileAnalyzerAndSorter" }
}

function Unregister-ScheduledSorter {
    Unregister-ScheduledTask -TaskName "FileAnalyzerAndSorter" -Confirm:$false
}