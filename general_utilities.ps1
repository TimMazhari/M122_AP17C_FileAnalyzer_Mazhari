<#
.DESCRIPTION
   Error that pops up when there are duplicates
.AUTHOR
    Mazhari Tim
#>


function Write-DuplicateError {
        Add-Type -AssemblyName PresentationCore,PresentationFramework
        $ButtonType = [System.Windows.MessageBoxButton]::Ok
        $MessageIcon = [System.Windows.MessageBoxImage]::Error
        $MessageBody = "Duplicate error"
        $MessageTitle = "No duplicate names are allowed"
        [System.Windows.MessageBox]::Show($MessageBody, $MessageTitle, $ButtonType, $MessageIcon)    
}