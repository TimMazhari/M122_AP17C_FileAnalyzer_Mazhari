. .\config_editor_gui.ps1
. .\global_rules_gui.ps1
. .\menu_gui.ps1
. .\monitored_folders_gui.ps1
. .\rule_config_gui.ps1
. .\folder_config_gui.ps1

[System.Windows.Forms.Form] $menuForm = Generate-MenuForm
 
$MenuForm.ShowDialog()