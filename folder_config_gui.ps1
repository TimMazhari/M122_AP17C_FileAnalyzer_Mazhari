. .\json_utilities.ps1
function generateFolderConfigForm {

    param(
        [string] $name
    )

[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

$folderConfigForm = New-Object System.Windows.Forms.Form
$addRuleButton = New-Object System.Windows.Forms.Button
$fileTypesLabel = New-Object System.Windows.Forms.Label
$dataGridView = New-Object System.Windows.Forms.DataGridView
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
    $ruleConfigForm = generateRuleConfigForm -Name $name
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

$dataGridView.AllowUserToAddRows = $False
$System_Windows_Forms_DataGridViewTextBoxColumn_1 = New-Object System.Windows.Forms.DataGridViewTextBoxColumn
$System_Windows_Forms_DataGridViewTextBoxColumn_1.HeaderText = "File type"
$System_Windows_Forms_DataGridViewTextBoxColumn_1.Name = ""
$System_Windows_Forms_DataGridViewTextBoxColumn_1.Width = 100

$dataGridView.Columns.Add($System_Windows_Forms_DataGridViewTextBoxColumn_1)|Out-Null
$System_Windows_Forms_DataGridViewTextBoxColumn_2 = New-Object System.Windows.Forms.DataGridViewTextBoxColumn
$System_Windows_Forms_DataGridViewTextBoxColumn_2.HeaderText = "Folder path"
$System_Windows_Forms_DataGridViewTextBoxColumn_2.Name = ""
$System_Windows_Forms_DataGridViewTextBoxColumn_2.Width = 300

$dataGridView.Columns.Add($System_Windows_Forms_DataGridViewTextBoxColumn_2)|Out-Null
$dataGridView.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 71
$dataGridView.Location = $System_Drawing_Point
$dataGridView.Name = "data$dataGridView"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 269
$System_Drawing_Size.Width = 444
$dataGridView.Size = $System_Drawing_Size
$dataGridView.TabIndex = 1

$folderConfigForm.Controls.Add($dataGridView)

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