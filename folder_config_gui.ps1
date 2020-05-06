. .\json_utilities.ps1
. .\config_editor_gui.ps1
<#
.DESCRIPTION
   All rules of a certain folder
.AUTHOR
    Mazhari Tim
#>

function Generate-FolderConfigForm {

    param(
        [string] $name
    )

[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

$script:folderConfigForm = New-Object System.Windows.Forms.Form
$addRuleButton = New-Object System.Windows.Forms.Button
$fileTypesLabel = New-Object System.Windows.Forms.Label
$script:ruleDataGridView = New-Object System.Windows.Forms.DataGridView
$title = New-Object System.Windows.Forms.Label

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 394
$System_Drawing_Size.Width = 478
$folderConfigForm.ClientSize = $System_Drawing_Size
$folderConfigForm.DataBindings.DefaultDataSourceUpdateMode = 0
$folderConfigForm.Name = "folderConfigForm$folderConfigForm"
$folderConfigForm.Text = "Folder config"

$addRuleButton.DataBindings.DefaultDataSourceUpdateMode = 0
$addRuleButton.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 363
$System_Drawing_Point.Y = 355
$addRuleButton.Location = $System_Drawing_Point
$addRuleButton.Name = "addRuleButton"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 93
$addRuleButton.Size = $System_Drawing_Size
$addRuleButton.TabIndex = 4
$addRuleButton.Text = "Add rule"
$addRuleButton.UseVisualStyleBackColor = $True
$addRuleButton.add_Click({
    $ruleConfigForm = Generate-RuleConfigForm -Name $name
    $ruleConfigForm.ShowDialog()
})

$folderConfigForm.Controls.Add($addRuleButton)


$fileTypesLabel.DataBindings.DefaultDataSourceUpdateMode = 0
$fileTypesLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 45
$fileTypesLabel.Location = $System_Drawing_Point
$fileTypesLabel.Name = "fileTypesLabel"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$fileTypesLabel.Size = $System_Drawing_Size
$fileTypesLabel.TabIndex = 2
$fileTypesLabel.Text = "File types"

$folderConfigForm.Controls.Add($fileTypesLabel)

$ruleDataGridView.AllowUserToAddRows = $False
$System_Windows_Forms_DataGridViewTextBoxColumn_1 = New-Object System.Windows.Forms.DataGridViewTextBoxColumn
$System_Windows_Forms_DataGridViewTextBoxColumn_1.HeaderText = "File type"
$System_Windows_Forms_DataGridViewTextBoxColumn_1.Name = ""
$System_Windows_Forms_DataGridViewTextBoxColumn_1.Width = 100

$ruleDataGridView.Columns.Add($System_Windows_Forms_DataGridViewTextBoxColumn_1)|Out-Null
$System_Windows_Forms_DataGridViewTextBoxColumn_2 = New-Object System.Windows.Forms.DataGridViewTextBoxColumn
$System_Windows_Forms_DataGridViewTextBoxColumn_2.HeaderText = "Folder path"
$System_Windows_Forms_DataGridViewTextBoxColumn_2.Name = ""
$System_Windows_Forms_DataGridViewTextBoxColumn_2.Width = 300

$ruleDataGridView.Columns.Add($System_Windows_Forms_DataGridViewTextBoxColumn_2)|Out-Null
$ruleDataGridView.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 71
$ruleDataGridView.Location = $System_Drawing_Point
$ruleDataGridView.Name = "data$ruleDataGridView"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 269
$System_Drawing_Size.Width = 444
$ruleDataGridView.Size = $System_Drawing_Size
$ruleDataGridView.TabIndex = 1

Populate-RuleGrid


$ruleDataGridView.Add_CellMouseDoubleClick({ 
    $ruleDataGridView.SelectedRows | ForEach-Object{
        #get values to pass as parameters
        $filetype = $_.Cells[0].Value
        $destination = $_.Cells[1].Value
        $path = $PSScriptRoot + "\monitored_folders.json"
        $jsonFilePath = $path
        [System.Collections.ArrayList] $allFolders = Get-Content $jsonFilePath | ConvertFrom-Json

        foreach($folder in $allFolders){
            foreach($rule in $folder.Rules){
                if($rule.Filetype -eq $filetype){
                    #get min and maxsize to pass as parameters
                    $maxSize = $rule.Maxsize
                    $minSize = $rule.Minsize
                }
            }
        }
        #Open RuleConfigForm with parameters so the values will already be filled 
        $monitoredFoldersForm = Generate-RuleConfigForm -Name $name -Filetype $filetype -Destination $destination -Maxsize $maxSize -Minsize $minSize -IsNewEntry $false
        $monitoredFoldersForm.ShowDialog()
 }})

$folderConfigForm.Controls.Add($ruleDataGridView)

$title.DataBindings.DefaultDataSourceUpdateMode = 0
$title.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",12,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 9
$title.Location = $System_Drawing_Point
$title.Name = "title"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 500
$title.Size = $System_Drawing_Size
$title.TabIndex = 0
$title.Text = "Folder: " + $name

$folderConfigForm.Controls.Add($title)

$folderConfigForm.add_Load($OnLoadForm_StateCorrection)

return $folderConfigForm

}

# Function to fill DataGridView with data from json
function Populate-RuleGrid{
    $ruleDataGridView.Rows.Clear()
    [System.Collections.ArrayList] $jsonFolders = Convert-FromJson
    foreach($folder in $jsonFolders){
        if($folder.Name -eq $name){
            foreach($rule in $folder.Rules){
                [void]$ruleDataGridView.Rows.Add($rule.Filetype, $rule.Destination)
            }
        }
    }
}