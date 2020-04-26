function generateConfigEditorForm() {

    param(
        [System.Windows.Forms.Form] $globalRulesForm,
        [System.Windows.Forms.Form] $monitoredFoldersForm
    )

[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

$form = New-Object System.Windows.Forms.Form
$editButton = New-Object System.Windows.Forms.Button
$AddFolderButton = New-Object System.Windows.Forms.Button
$globalRulesButton = New-Object System.Windows.Forms.Button
$title = New-Object System.Windows.Forms.Label
$dataGridView1 = New-Object System.Windows.Forms.DataGridView

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 326
$System_Drawing_Size.Width = 528
$form.ClientSize = $System_Drawing_Size
$form.DataBindings.DefaultDataSourceUpdateMode = 0
$form.Name = "form"
$form.Text = "Config Editor"
$form.add_Load($handler_form_Load)

$editButton.DataBindings.DefaultDataSourceUpdateMode = 0
$editButton.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 285
$editButton.Location = $System_Drawing_Point
$editButton.Name = "editButton"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$editButton.Size = $System_Drawing_Size
$editButton.TabIndex = 4
$editButton.Text = "Edit"
$editButton.UseVisualStyleBackColor = $True

$form.Controls.Add($editButton)

$AddFolderButton.DataBindings.DefaultDataSourceUpdateMode = 0
$AddFolderButton.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 421
$System_Drawing_Point.Y = 285
$AddFolderButton.Location = $System_Drawing_Point
$AddFolderButton.Name = "AddFolderButton"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 94
$AddFolderButton.Size = $System_Drawing_Size
$AddFolderButton.TabIndex = 3
$AddFolderButton.Text = "Add folder"
$AddFolderButton.UseVisualStyleBackColor = $True
$AddFolderButton.add_Click( { $monitoredFoldersForm.ShowDialog() } )

$form.Controls.Add($AddFolderButton)

$globalRulesButton.DataBindings.DefaultDataSourceUpdateMode = 0
$globalRulesButton.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 421
$System_Drawing_Point.Y = 12
$globalRulesButton.Location = $System_Drawing_Point
$globalRulesButton.Name = "globalRulesButton"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 95
$globalRulesButton.Size = $System_Drawing_Size
$globalRulesButton.TabIndex = 2
$globalRulesButton.Text = "Global rules"
$globalRulesButton.UseVisualStyleBackColor = $True
$globalRulesButton.add_Click( { $globalRulesForm.ShowDialog() } )

$form.Controls.Add($globalRulesButton)

$title.DataBindings.DefaultDataSourceUpdateMode = 0
$title.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",12,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 13
$title.Location = $System_Drawing_Point
$title.Name = "title"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 142
$title.Size = $System_Drawing_Size
$title.TabIndex = 1
$title.Text = "Monitored folders"

$form.Controls.Add($title)

$dataGridView1.AllowUserToAddRows = $False
$dataGridView1.AllowUserToOrderColumns = $True
$dataGridView1.AllowUserToResizeRows = $False
$System_Windows_Forms_DataGridViewTextBoxColumn_1 = New-Object System.Windows.Forms.DataGridViewTextBoxColumn
$System_Windows_Forms_DataGridViewTextBoxColumn_1.HeaderText = "Name"
$System_Windows_Forms_DataGridViewTextBoxColumn_1.Name = ""
$System_Windows_Forms_DataGridViewTextBoxColumn_1.Width = 160

$dataGridView1.Columns.Add($System_Windows_Forms_DataGridViewTextBoxColumn_1)|Out-Null
$System_Windows_Forms_DataGridViewTextBoxColumn_2 = New-Object System.Windows.Forms.DataGridViewTextBoxColumn
$System_Windows_Forms_DataGridViewTextBoxColumn_2.HeaderText = "Path"
$System_Windows_Forms_DataGridViewTextBoxColumn_2.Name = ""
$System_Windows_Forms_DataGridViewTextBoxColumn_2.Width = 300

$dataGridView1.Columns.Add($System_Windows_Forms_DataGridViewTextBoxColumn_2)|Out-Null
$dataGridView1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 59
$dataGridView1.Location = $System_Drawing_Point
$dataGridView1.Name = "dataGridView1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 210
$System_Drawing_Size.Width = 504
$dataGridView1.Size = $System_Drawing_Size
$dataGridView1.TabIndex = 0

$form.Controls.Add($dataGridView1)

$form.add_Load($OnLoadForm_StateCorrection)

return $form

}