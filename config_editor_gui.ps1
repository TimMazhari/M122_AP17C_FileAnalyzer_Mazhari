. .\utilities\json_utilities.ps1

function Generate-ConfigEditorForm() {

[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

$config_editor_form = New-Object System.Windows.Forms.Form
$editButton = New-Object System.Windows.Forms.Button
$AddFolderButton = New-Object System.Windows.Forms.Button
$globalRulesButton = New-Object System.Windows.Forms.Button
$title = New-Object System.Windows.Forms.Label
$script:folderDataGridView = New-Object System.Windows.Forms.DataGridView

$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 326
$System_Drawing_Size.Width = 528
$config_editor_form.ClientSize = $System_Drawing_Size
$config_editor_form.DataBindings.DefaultDataSourceUpdateMode = 0
$config_editor_form.Name = "config_editor_form"
$config_editor_form.Text = "Config Editor"
$config_editor_form.add_Load($handler_form_Load)

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
$editButton.add_Click({ 
                        $folderDataGridView.SelectedRows | ForEach-Object{
                            $name = $_.Cells[0].Value
                            $path = $_.Cells[1].Value
                            $monitoredFoldersForm = Generate-MonitoredFoldersForm -Name $name -Path $path -IsNewFolder $false
                            $monitoredFoldersForm.ShowDialog()
                        }
                        })

$config_editor_form.Controls.Add($editButton)

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
$AddFolderButton.add_Click( { 
    # generate a new monitored folders form so there wont be complications when running after edit
    $monitoredFoldersForm = Generate-MonitoredFoldersForm
    $monitoredFoldersForm.ShowDialog() } )

$config_editor_form.Controls.Add($AddFolderButton)

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
$globalRulesButton.add_Click( { 
    $globalRulesForm = Generate-GlobalRulesForm
    $globalRulesForm.ShowDialog() } )

$config_editor_form.Controls.Add($globalRulesButton)

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

$config_editor_form.Controls.Add($title)

$folderDataGridView.AllowUserToAddRows = $False
$folderDataGridView.AllowUserToOrderColumns = $True
$folderDataGridView.AllowUserToResizeRows = $False
$System_Windows_Forms_DataGridViewTextBoxColumn_1 = New-Object System.Windows.Forms.DataGridViewTextBoxColumn
$System_Windows_Forms_DataGridViewTextBoxColumn_1.HeaderText = "Name"
$System_Windows_Forms_DataGridViewTextBoxColumn_1.Name = ""
$System_Windows_Forms_DataGridViewTextBoxColumn_1.Width = 160

$folderDataGridView.Columns.Add($System_Windows_Forms_DataGridViewTextBoxColumn_1)|Out-Null
$System_Windows_Forms_DataGridViewTextBoxColumn_2 = New-Object System.Windows.Forms.DataGridViewTextBoxColumn
$System_Windows_Forms_DataGridViewTextBoxColumn_2.HeaderText = "Path"
$System_Windows_Forms_DataGridViewTextBoxColumn_2.Name = ""
$System_Windows_Forms_DataGridViewTextBoxColumn_2.Width = 300

$folderDataGridView.Columns.Add($System_Windows_Forms_DataGridViewTextBoxColumn_2)|Out-Null
$folderDataGridView.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 59
$folderDataGridView.Location = $System_Drawing_Point
$folderDataGridView.Name = "folderDataGridView"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 210
$System_Drawing_Size.Width = 504
$folderDataGridView.Size = $System_Drawing_Size
$folderDataGridView.TabIndex = 0

Populate-FolderGrid

$folderDataGridView.Add_CellMouseDoubleClick({ 
    $folderDataGridView.SelectedRows | ForEach-Object{
        
        $name = $_.Cells[0].Value
        $folderConfigForm = Generate-FolderConfigForm -Name $name
        $folderConfigForm.ShowDialog()
 }})

$config_editor_form.Controls.Add($folderDataGridView)



$config_editor_form.add_Load($OnLoadForm_StateCorrection)

return $config_editor_form

}

function Populate-FolderGrid{
    $folderDataGridView.Rows.Clear()
    [System.Collections.ArrayList] $jsonFolders = Convert-FromJson
    foreach($f in $jsonFolders){
        [void]$folderDataGridView.Rows.Add($f.Name, $f.Path)
    }
}