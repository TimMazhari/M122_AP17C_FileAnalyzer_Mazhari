. .\json_utilities.ps1
. .\file_explorer_gui.ps1
. .\folder_config_gui.ps1
. .\general_utilities.ps1
function generateRuleConfigForm {

    param(
        [string] $name,
        [string] $filetype = "",
        [string] $destination = ""
    )

    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    
    $script:ruleConfigForm = New-Object System.Windows.Forms.Form
    $deleteButton = New-Object System.Windows.Forms.Button
    $script:maxSizeNumericUpDown = New-Object System.Windows.Forms.NumericUpDown
    $maxSizeLabel = New-Object System.Windows.Forms.Label
    $script:minSizeNumericUpDown = New-Object System.Windows.Forms.NumericUpDown
    $minSizeLabel = New-Object System.Windows.Forms.Label
    $fileExplorerButton = New-Object System.Windows.Forms.Button
    $script:destinationTextBox = New-Object System.Windows.Forms.TextBox
    $destinationLabel = New-Object System.Windows.Forms.Label
    $script:typeTextBox = New-Object System.Windows.Forms.TextBox
    $typeLabel = New-Object System.Windows.Forms.Label
    $cancelButton = New-Object System.Windows.Forms.Button
    $saveButton = New-Object System.Windows.Forms.Button
    
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 241
    $System_Drawing_Size.Width = 400
    $ruleConfigForm.ClientSize = $System_Drawing_Size
    $ruleConfigForm.DataBindings.DefaultDataSourceUpdateMode = 0
    $ruleConfigForm.Name = "ruleConfigForm$ruleConfigForm"
    $ruleConfigForm.Text = "Rule config"
    $ruleConfigForm.add_Load($handler_form1_Load)
    
    $deleteButton.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 13
    $System_Drawing_Point.Y = 206
    $deleteButton.Location = $System_Drawing_Point
    $deleteButton.Name = "deleteButton"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 75
    $deleteButton.Size = $System_Drawing_Size
    $deleteButton.TabIndex = 11
    $deleteButton.Text = "Delete"
    $deleteButton.UseVisualStyleBackColor = $True
    
    $ruleConfigForm.Controls.Add($deleteButton)
    
    $maxSizeNumericUpDown.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 97
    $System_Drawing_Point.Y = 133
    $maxSizeNumericUpDown.Location = $System_Drawing_Point
    $maxSizeNumericUpDown.Name = "maxSizeNumericUpDown"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 120
    $maxSizeNumericUpDown.Size = $System_Drawing_Size
    $maxSizeNumericUpDown.TabIndex = 10
    
    $ruleConfigForm.Controls.Add($maxSizeNumericUpDown)
    
    $maxSizeLabel.DataBindings.DefaultDataSourceUpdateMode = 0
    $maxSizeLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 133
    $maxSizeLabel.Location = $System_Drawing_Point
    $maxSizeLabel.Name = "maxSizeLabel"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 100
    $maxSizeLabel.Size = $System_Drawing_Size
    $maxSizeLabel.TabIndex = 9
    $maxSizeLabel.Text = "Max size:"
    
    $ruleConfigForm.Controls.Add($maxSizeLabel)
    
    $minSizeNumericUpDown.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 97
    $System_Drawing_Point.Y = 95
    $minSizeNumericUpDown.Location = $System_Drawing_Point
    $minSizeNumericUpDown.Name = "minSizeNumericUpDown"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 120
    $minSizeNumericUpDown.Size = $System_Drawing_Size
    $minSizeNumericUpDown.TabIndex = 8

    
    $ruleConfigForm.Controls.Add($minSizeNumericUpDown)
    
    $minSizeLabel.DataBindings.DefaultDataSourceUpdateMode = 0
    $minSizeLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 95
    $minSizeLabel.Location = $System_Drawing_Point
    $minSizeLabel.Name = "minSizeLabel"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 100
    $minSizeLabel.Size = $System_Drawing_Size
    $minSizeLabel.TabIndex = 7
    $minSizeLabel.Text = "Min size:"
    
    $ruleConfigForm.Controls.Add($minSizeLabel)
    
    $fileExplorerButton.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 368
    $System_Drawing_Point.Y = 58
    $fileExplorerButton.Location = $System_Drawing_Point
    $fileExplorerButton.Name = "fileExplorerButton"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 22
    $System_Drawing_Size.Width = 24
    $fileExplorerButton.Size = $System_Drawing_Size
    $fileExplorerButton.TabIndex = 6
    $fileExplorerButton.Text = "..."
    $fileExplorerButton.UseVisualStyleBackColor = $True
    $fileExplorerButton.add_Click( {  $destinationTextBox.Text = Select-FolderDialog } )

    $ruleConfigForm.Controls.Add($fileExplorerButton)
    
    $destinationTextBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 97
    $System_Drawing_Point.Y = 59
    $destinationTextBox.Location = $System_Drawing_Point
    $destinationTextBox.Name = "destinationTextBox"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 271
    $destinationTextBox.Size = $System_Drawing_Size
    $destinationTextBox.TabIndex = 5
    $ruleConfigForm.Controls.Add($destinationTextBox)
    $destinationTextBox.Text = $destination

    $destinationLabel.DataBindings.DefaultDataSourceUpdateMode = 0
    $destinationLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 61
    $destinationLabel.Location = $System_Drawing_Point
    $destinationLabel.Name = "destinationLabel$destinationLabel"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 100
    $destinationLabel.Size = $System_Drawing_Size
    $destinationLabel.TabIndex = 4
    $destinationLabel.Text = "Destination:"
    
    $ruleConfigForm.Controls.Add($destinationLabel)
    
    $typeTextBox.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 97
    $System_Drawing_Point.Y = 17
    $typeTextBox.Location = $System_Drawing_Point
    $typeTextBox.Name = "typeTextBox"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 87
    $typeTextBox.Size = $System_Drawing_Size
    $typeTextBox.TabIndex = 3
    $ruleConfigForm.Controls.Add($typeTextBox)
    $typeTextBox.Text = $filetype

    $typeLabel.DataBindings.DefaultDataSourceUpdateMode = 0
    $typeLabel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 18
    $typeLabel.Location = $System_Drawing_Point
    $typeLabel.Name = "typeLabel$typeLabel"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 21
    $System_Drawing_Size.Width = 50
    $typeLabel.Size = $System_Drawing_Size
    $typeLabel.TabIndex = 2
    $typeLabel.Text = "Type:"
    
    $ruleConfigForm.Controls.Add($typeLabel)
    
    $cancelButton.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 222
    $System_Drawing_Point.Y = 206
    $cancelButton.Location = $System_Drawing_Point
    $cancelButton.Name = "cancelButton$cancelButton"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 75
    $cancelButton.Size = $System_Drawing_Size
    $cancelButton.TabIndex = 1
    $cancelButton.Text = "Cancel"
    $cancelButton.UseVisualStyleBackColor = $True
    
    $ruleConfigForm.Controls.Add($cancelButton)
    
    $saveButton.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 313
    $System_Drawing_Point.Y = 206
    $saveButton.Location = $System_Drawing_Point
    $saveButton.Name = "saveButton$saveButton"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 75
    $saveButton.Size = $System_Drawing_Size
    $saveButton.TabIndex = 0
    $saveButton.Text = "Save"
    $saveButton.UseVisualStyleBackColor = $True
    $saveButton.add_Click({
        [System.Collections.ArrayList]$jsonFolders = Convert-FromJson
        [System.Collections.ArrayList]$allFolders = @()
        $script:isNew = $True

        foreach($folder in $jsonFolders){
            if($folder.Name -eq $name){
                if($folder.Rules.Count -gt 0){
                    foreach($rule in $folder.Rules){
                        if($rule.Filetype -eq $filetype){
                            $isNew = $False
                            $rule.Destination = $destinationTextBox.Text
                        }                    
                    }
                }
                if($isNew){
                    $rule = Create-FolderTypesObject -fileType $typeTextBox.Text -minsize $minSizeNumericUpDown.Text -maxsize $maxSizeNumericUpDown.Text -destination $destinationTextBox.Text
                    $folder.Rules += $rule
                }

                $allUniqueRules = $folder.Rules  | Select-Object -Property Filetype -Unique
                $duplicateRules = Compare-Object -ReferenceObject $allUniqueRules -DifferenceObject $folder.Rules
                if($null -ne $duplicateRules){
                    Write-DuplicateError
                    Return
                }

                
            }
            $allFolders.Add($folder)
        }
        
        Save-AsJson( $allFolders )
        Populate-RuleGrid
        $ruleConfigForm.Close()

    })
    $ruleConfigForm.Controls.Add($saveButton)
    
    $ruleConfigForm.add_Load($OnLoadForm_StateCorrection)
    
    return $ruleConfigForm
    
    }