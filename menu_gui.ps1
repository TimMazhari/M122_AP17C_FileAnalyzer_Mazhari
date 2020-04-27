function generateMenuForm {


[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

$form = New-Object System.Windows.Forms.Form
$configButton = New-Object System.Windows.Forms.Button
$stopButton = New-Object System.Windows.Forms.Button
$status = New-Object System.Windows.Forms.Label
$statusLabel = New-Object System.Windows.Forms.Label


$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 132
$System_Drawing_Size.Width = 263
$form.ClientSize = $System_Drawing_Size
$form.DataBindings.DefaultDataSourceUpdateMode = 0
$form.Name = "form"
$form.Text = "File Analyzer"
$form.add_Load($handler_form_Load)

$configButton.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 176
$System_Drawing_Point.Y = 73
$configButton.Location = $System_Drawing_Point
$configButton.Name = "configButton"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$configButton.Size = $System_Drawing_Size
$configButton.TabIndex = 3
$configButton.Text = "config"
$configButton.UseVisualStyleBackColor = $True
$configButton.add_Click( { 
    $configEditorForm = generateConfigEditorForm
    $configEditorForm.ShowDialog() } )

$form.Controls.Add($configButton)

$stopButton.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 73
$stopButton.Location = $System_Drawing_Point
$stopButton.Name = "stopButton"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$stopButton.Size = $System_Drawing_Size
$stopButton.TabIndex = 2
$stopButton.Text = "Stop"
$stopButton.UseVisualStyleBackColor = $True


$form.Controls.Add($stopButton)

$status.DataBindings.DefaultDataSourceUpdateMode = 0
$status.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",11.25,0,3,1)
$status.ForeColor = [System.Drawing.Color]::FromArgb(255,0,192,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 80
$System_Drawing_Point.Y = 29
$status.Location = $System_Drawing_Point
$status.Name = "status$status"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$status.Size = $System_Drawing_Size
$status.TabIndex = 1
$status.Text = "running"

$form.Controls.Add($status)

$statusLabel.DataBindings.DefaultDataSourceUpdateMode = 0
$statusLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",11.25,0,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 29
$statusLabel.Location = $System_Drawing_Point
$statusLabel.Name = "statusLabel"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 58
$statusLabel.Size = $System_Drawing_Size
$statusLabel.TabIndex = 0
$statusLabel.Text = "Status:"

$form.Controls.Add($statusLabel)

$form.add_Load($OnLoadForm_StateCorrection)

return $form

}