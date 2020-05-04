
function Generate-MenuForm {


[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

$form = New-Object System.Windows.Forms.Form
$configButton = New-Object System.Windows.Forms.Button
$script:startButton = New-Object System.Windows.Forms.Button
$script:status = New-Object System.Windows.Forms.Label
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
    $configEditorForm = Generate-ConfigEditorForm
    $configEditorForm.ShowDialog() } )

$form.Controls.Add($configButton)

$startButton.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 26
$System_Drawing_Point.Y = 73
$startButton.Location = $System_Drawing_Point
$startButton.Name = "startButton"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$startButton.Size = $System_Drawing_Size
$startButton.TabIndex = 2

$service = Get-Service -Name FolderSorter -ErrorAction SilentlyContinue

if($null -ne $service){
    $status.ForeColor = [System.Drawing.Color]::Green
    $status.Text = "running"
    $startButton.Text = "Stop"

} else{
    $status.ForeColor = [System.Drawing.Color]::Red
    $status.Text = "not running"
    $startButton.Text = "Start"
}

$startButton.UseVisualStyleBackColor = $True

$startButton.add_Click({
    if($startButton.Text -eq "Start"){

        $relativePathModule = Resolve-Path ..\..\..\..\Users\$env:UserName\.vscode\extensions\ironmansoftware.powershellprotools-5.10.0\out\PowerShellProTools.VSCode.psd1
        Import-Module $relativePathModule -ArgumentList @($false)


        $relativePathConfigFile = Resolve-Path .\ServiceStuff\Service\package.psd1
        Merge-Script -Verbose -ConfigFile $relativePathConfigFile
        
        $relativePathExe = Resolve-Path .\ServiceStuff\folder_sort_service.exe
        New-Service -Name "FolderSorter" -BinaryPathName $relativePathExe

        Get-Service FolderSorter | Start-Service
    }else{
        Get-Service FolderSorter | Stop-Service | sc.exe delete FolderSorter
    }

    $service = Get-Service -Name FolderSorter -ErrorAction SilentlyContinue
    if($null -ne $service){
        $status.ForeColor = [System.Drawing.Color]::Green
        $status.Text = "running"
        $startButton.Text = "Stop"
    } else{
        $status.ForeColor = [System.Drawing.Color]::Red
        $status.Text = "not running"
        $startButton.Text = "Start"
    }
})
$form.Controls.Add($startButton)

$status.DataBindings.DefaultDataSourceUpdateMode = 0
$status.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",11.25,0,3,1)

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