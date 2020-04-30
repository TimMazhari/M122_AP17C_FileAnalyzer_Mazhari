. .\file_explorer_gui.ps1
. .\json_utilities.ps1
. .\config_editor_gui.ps1
. .\general_utilities.ps1
function Generate-MonitoredFoldersForm {

    param(
        [string] $name = "",
        [string] $path = "",
        $dataGridView = $null
    )

    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    
    $script:monitored_folders_form = New-Object System.Windows.Forms.Form
    $cancelButton = New-Object System.Windows.Forms.Button
    $saveButton = New-Object System.Windows.Forms.Button
    $fileExplorerButton = New-Object System.Windows.Forms.Button
    $script:textPathNameBox = New-Object System.Windows.Forms.TextBox
    $pathLabel= New-Object System.Windows.Forms.Label
    $script:textNameBox = New-Object System.Windows.Forms.TextBox
    $nameLabel = New-Object System.Windows.Forms.Label
    
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 134
    $System_Drawing_Size.Width = 440
    $monitored_folders_form.ClientSize = $System_Drawing_Size
    $monitored_folders_form.DataBindings.DefaultDataSourceUpdateMode = 0
    $monitored_folders_form.Name = "monitored_folders_form"
    $monitored_folders_form.Text = "Monitored folder"
    
    $cancelButton.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 268
    $System_Drawing_Point.Y = 99
    $cancelButton.Location = $System_Drawing_Point
    $cancelButton.Name = "cancelButton"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 75
    $cancelButton.Size = $System_Drawing_Size
    $cancelButton.TabIndex = 6
    $cancelButton.Text = "Cancel"
    $cancelButton.UseVisualStyleBackColor = $True
    $cancelButton.add_Click({$monitored_folders_form.Close()
                             Clear-TextBoxes})
    
    $monitored_folders_form.Controls.Add($cancelButton)
    
    $saveButton.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 349
    $System_Drawing_Point.Y = 99
    $saveButton.Location = $System_Drawing_Point
    $saveButton.Name = "saveButton"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 75
    $saveButton.Size = $System_Drawing_Size
    $saveButton.TabIndex = 5
    $saveButton.Text = "Save"
    $saveButton.UseVisualStyleBackColor = $True
    $saveButton.add_Click({
        [System.Collections.ArrayList] $allFolders = @()
        [System.Collections.ArrayList] $jsonFolders = Convert-FromJson
        $script:isNew = $True
        
        foreach ($oldFolder in $jsonFolders){
            IF ($oldFolder.Name -eq $name ) {
                # if the name already exists we simply adjust the new values
                $isNew = $False
                $oldFolder.Path = $textPathNameBox.Text
                $oldFolder.Name = $textNameBox.Text
            }
            $allFolders.Add($oldFolder)
        }
        
        if ($isNew) {
            $newFolder = Create-JsonFolderObject -name $textNameBox.Text -path $textPathNameBox.Text
            $allFolders.Add($newFolder)
        }

        $allUniqueFolders = $allFolders  | Select-Object -Property Name -Unique
        $duplicateFolders = Compare-Object -ReferenceObject $allUniqueFolders -DifferenceObject $allFolders
        if($null -ne $duplicateFolders){
            Write-DuplicateError
            Return
        }
        Save-AsJson( $allFolders )
        $monitored_folders_form.Close() 
        Populate-FolderGrid
        
    })
    $monitored_folders_form.Controls.Add($saveButton)
    
    $fileExplorerButton.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 398
    $System_Drawing_Point.Y = 53
    $fileExplorerButton.Location = $System_Drawing_Point
    $fileExplorerButton.Name = "fileExplorerButton"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 22
    $System_Drawing_Size.Width = 26
    $fileExplorerButton.Size = $System_Drawing_Size
    $fileExplorerButton.TabIndex = 4
    $fileExplorerButton.Text = "..."
    $fileExplorerButton.UseVisualStyleBackColor = $True
    $fileExplorerButton.add_Click( {  $textPathNameBox.Text = Select-FolderDialog } )
    


    $monitored_folders_form.Controls.Add($fileExplorerButton)
    
    $textPathNameBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 70
    $System_Drawing_Point.Y = 54
    $textPathNameBox.Location = $System_Drawing_Point
    $textPathNameBox.Name = "textPathNameBox"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 328
    $textPathNameBox.Size = $System_Drawing_Size
    $textPathNameBox.TabIndex = 3
    $textPathNameBox.Text = $path

    $monitored_folders_form.Controls.Add($textPathNameBox)
    
    $pathLabel.DataBindings.DefaultDataSourceUpdateMode = 0
    $pathLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 13
    $System_Drawing_Point.Y = 56
    $pathLabel.Location = $System_Drawing_Point
    $System_Windows_Forms_Padding = New-Object System.Windows.Forms.Padding
    $System_Windows_Forms_Padding.Bottom = 0
    $System_Windows_Forms_Padding.Left = 3
    $System_Windows_Forms_Padding.Right = 3
    $System_Windows_Forms_Padding.Top = 2
    $pathLabel.Margin = $System_Windows_Forms_Padding
    $pathLabel.Name = "pathLabel"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 51
    $pathLabel.Size = $System_Drawing_Size
    $pathLabel.TabIndex = 2
    $pathLabel.Text = "Path:"
    
    $monitored_folders_form.Controls.Add($pathLabel)
    
    $textNameBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 70
    $System_Drawing_Point.Y = 12
    $textNameBox.Location = $System_Drawing_Point
    $textNameBox.Name = "textNameBox"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 139
    $textNameBox.Size = $System_Drawing_Size
    $textNameBox.TabIndex = 1
    $textNameBox.Text = $name
    
    $monitored_folders_form.Controls.Add($textNameBox)
    
    $nameLabel.DataBindings.DefaultDataSourceUpdateMode = 0
    $nameLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 13
    $System_Drawing_Point.Y = 13
    $nameLabel.Location = $System_Drawing_Point
    $nameLabel.Name = "nameLabel"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 51
    $nameLabel.Size = $System_Drawing_Size
    $nameLabel.TabIndex = 0
    $nameLabel.Text = "Name:"
    
    $monitored_folders_form.Controls.Add($nameLabel)
    
    $monitored_folders_form.add_Load($OnLoadForm_StateCorrection)
    
    return $monitored_folders_form
    
    }
