<#
.DESCRIPTION
    Fileexplorer gui
.AUTHOR
    Mazhari Tim
#>


#function to open a file selector
Function Select-FolderDialog
{
    param([string]$Description="Select Folder",[string]$RootFolder="Desktop")

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
        Out-Null     

    $objForm = New-Object System.Windows.Forms.FolderBrowserDialog
        $objForm.Rootfolder = $RootFolder
        $objForm.Description = $Description
        $Show = $objForm.ShowDialog()
        If ($Show -eq "OK"){   
            Return $objForm.SelectedPath
        }Else{
            Return ""
        }
}
