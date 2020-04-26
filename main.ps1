. .\config_editor_gui.ps1
. .\global_rules_gui.ps1
. .\menu_gui.ps1
. .\monitored_folders_gui.ps1
. .\rule_config_gui.ps1
. .\folder_config_gui.ps1

[System.Windows.Forms.Form] $ruleConfigForm = generateRuleConfigForm
[System.Windows.Forms.Form] $folderConfigForm = generateFolderConfigForm $ruleConfigForm
[System.Windows.Forms.Form] $monitoredFoldersForm = generateMonitoredFoldersForm
[System.Windows.Forms.Form] $globalRulesForm = generateGlobalRulesForm
[System.Windows.Forms.Form] $configEditorForm = generateConfigEditorForm $globalRulesForm $monitoredFoldersForm
[System.Windows.Forms.Form] $menuForm = generateMenuForm $configEditorForm

$MenuForm.ShowDialog()