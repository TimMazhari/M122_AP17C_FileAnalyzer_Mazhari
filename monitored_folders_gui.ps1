. .\file_explorer_gui.ps1
function generateMonitoredFoldersForm {

    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    
    $form = New-Object System.Windows.Forms.Form
    $button3 = New-Object System.Windows.Forms.Button
    $button2 = New-Object System.Windows.Forms.Button
    $button1 = New-Object System.Windows.Forms.Button
    $global:textPathName = New-Object System.Windows.Forms.TextBox
    $label2 = New-Object System.Windows.Forms.Label
    $textBox1 = New-Object System.Windows.Forms.TextBox
    $label1 = New-Object System.Windows.Forms.Label
    
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 134
    $System_Drawing_Size.Width = 440
    $form.ClientSize = $System_Drawing_Size
    $form.DataBindings.DefaultDataSourceUpdateMode = 0
    $form.Name = "form"
    $form.Text = "Monitored folder"
    
    $button3.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 268
    $System_Drawing_Point.Y = 99
    $button3.Location = $System_Drawing_Point
    $button3.Name = "button3"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 75
    $button3.Size = $System_Drawing_Size
    $button3.TabIndex = 6
    $button3.Text = "Cancel"
    $button3.UseVisualStyleBackColor = $True
    
    $form.Controls.Add($button3)
    
    $button2.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 349
    $System_Drawing_Point.Y = 99
    $button2.Location = $System_Drawing_Point
    $button2.Name = "button2"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 75
    $button2.Size = $System_Drawing_Size
    $button2.TabIndex = 5
    $button2.Text = "Save"
    $button2.UseVisualStyleBackColor = $True
    
    $form.Controls.Add($button2)
    
    $button1.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 398
    $System_Drawing_Point.Y = 53
    $button1.Location = $System_Drawing_Point
    $button1.Name = "button1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 22
    $System_Drawing_Size.Width = 26
    $button1.Size = $System_Drawing_Size
    $button1.TabIndex = 4
    $button1.Text = "..."
    $button1.UseVisualStyleBackColor = $True
    $button1.add_Click( {  $textPathName.Text = Select-FolderDialog } )
    


    $form.Controls.Add($button1)
    
    $textPathName.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 70
    $System_Drawing_Point.Y = 54
    $textPathName.Location = $System_Drawing_Point
    $textPathName.Name = "textPathName"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 328
    $textPathName.Size = $System_Drawing_Size
    $textPathName.TabIndex = 3
    
    $form.Controls.Add($textPathName)
    
    $label2.DataBindings.DefaultDataSourceUpdateMode = 0
    $label2.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 13
    $System_Drawing_Point.Y = 56
    $label2.Location = $System_Drawing_Point
    $System_Windows_Forms_Padding = New-Object System.Windows.Forms.Padding
    $System_Windows_Forms_Padding.Bottom = 0
    $System_Windows_Forms_Padding.Left = 3
    $System_Windows_Forms_Padding.Right = 3
    $System_Windows_Forms_Padding.Top = 2
    $label2.Margin = $System_Windows_Forms_Padding
    $label2.Name = "label2"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 51
    $label2.Size = $System_Drawing_Size
    $label2.TabIndex = 2
    $label2.Text = "Path:"
    
    $form.Controls.Add($label2)
    
    $textBox1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 70
    $System_Drawing_Point.Y = 12
    $textBox1.Location = $System_Drawing_Point
    $textBox1.Name = "textBox1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 139
    $textBox1.Size = $System_Drawing_Size
    $textBox1.TabIndex = 1
    
    $form.Controls.Add($textBox1)
    
    $label1.DataBindings.DefaultDataSourceUpdateMode = 0
    $label1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 13
    $System_Drawing_Point.Y = 13
    $label1.Location = $System_Drawing_Point
    $label1.Name = "label1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 51
    $label1.Size = $System_Drawing_Size
    $label1.TabIndex = 0
    $label1.Text = "Name:"
    
    $form.Controls.Add($label1)
    
    $form.add_Load($OnLoadForm_StateCorrection)
    
    return $form
    
    }