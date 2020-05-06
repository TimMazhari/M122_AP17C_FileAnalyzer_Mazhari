. .\config_editor_gui.ps1
. .\menu_gui.ps1
. .\monitored_folders_gui.ps1
. .\rule_config_gui.ps1
. .\folder_config_gui.ps1
<#
.DESCRIPTION
   Startfile
.AUTHOR
    Mazhari Tim
#>

 [System.Windows.Forms.Form] $menuForm = Generate-MenuForm
  $MenuForm.ShowDialog()
