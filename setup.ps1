<#
.DESCRIPTION
   Create exe and shortcut
.AUTHOR
    Mazhari Tim
#>


function Initialize-Program {
    #Create Exe from ps1
     .\PS2EXE\ps2exe.ps1 -inputFile main.ps1 -outputFile main.exe

}

function Create-Shortcut {
    #Path for the shortcut
    $destination = [System.Environment]::GetFolderPath("Desktop") + "\FileSorter.lnk"
    #File that will be linked
    $sourceFile = $PSScriptRoot + "\main.exe"

    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($destination)
    $Shortcut.TargetPath = $sourceFile
    #WorkingDirectory is needed so that all the other imports wont be affected by the shortcuts location
    $Shortcut.WorkingDirectory = $PSScriptRoot
    $IconLocation = $PSScriptRoot + "\ShortcutIcon.ico"
    $Shortcut.IconLocation = "$IconLocation"
    $Shortcut.Save()
}

Initialize-Program
Create-Shortcut