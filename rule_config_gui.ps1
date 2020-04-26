function generateRuleConfigForm {

    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    
    $form1 = New-Object System.Windows.Forms.Form
    $button4 = New-Object System.Windows.Forms.Button
    $numericUpDown2 = New-Object System.Windows.Forms.NumericUpDown
    $label4 = New-Object System.Windows.Forms.Label
    $numericUpDown1 = New-Object System.Windows.Forms.NumericUpDown
    $label3 = New-Object System.Windows.Forms.Label
    $button3 = New-Object System.Windows.Forms.Button
    $textBox2 = New-Object System.Windows.Forms.TextBox
    $label2 = New-Object System.Windows.Forms.Label
    $textBox1 = New-Object System.Windows.Forms.TextBox
    $label1 = New-Object System.Windows.Forms.Label
    $button2 = New-Object System.Windows.Forms.Button
    $button1 = New-Object System.Windows.Forms.Button
    
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 241
    $System_Drawing_Size.Width = 400
    $form1.ClientSize = $System_Drawing_Size
    $form1.DataBindings.DefaultDataSourceUpdateMode = 0
    $form1.Name = "form1"
    $form1.Text = "Rule config"
    $form1.add_Load($handler_form1_Load)
    
    $button4.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 13
    $System_Drawing_Point.Y = 206
    $button4.Location = $System_Drawing_Point
    $button4.Name = "button4"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 75
    $button4.Size = $System_Drawing_Size
    $button4.TabIndex = 11
    $button4.Text = "Delete"
    $button4.UseVisualStyleBackColor = $True
    
    $form1.Controls.Add($button4)
    
    $numericUpDown2.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 97
    $System_Drawing_Point.Y = 133
    $numericUpDown2.Location = $System_Drawing_Point
    $numericUpDown2.Name = "numericUpDown2"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 120
    $numericUpDown2.Size = $System_Drawing_Size
    $numericUpDown2.TabIndex = 10
    
    $form1.Controls.Add($numericUpDown2)
    
    $label4.DataBindings.DefaultDataSourceUpdateMode = 0
    $label4.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 133
    $label4.Location = $System_Drawing_Point
    $label4.Name = "label4"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 100
    $label4.Size = $System_Drawing_Size
    $label4.TabIndex = 9
    $label4.Text = "Max size:"
    
    $form1.Controls.Add($label4)
    
    $numericUpDown1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 97
    $System_Drawing_Point.Y = 95
    $numericUpDown1.Location = $System_Drawing_Point
    $numericUpDown1.Name = "numericUpDown1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 120
    $numericUpDown1.Size = $System_Drawing_Size
    $numericUpDown1.TabIndex = 8
    
    $form1.Controls.Add($numericUpDown1)
    
    $label3.DataBindings.DefaultDataSourceUpdateMode = 0
    $label3.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 95
    $label3.Location = $System_Drawing_Point
    $label3.Name = "label3"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 100
    $label3.Size = $System_Drawing_Size
    $label3.TabIndex = 7
    $label3.Text = "Min size:"
    
    $form1.Controls.Add($label3)
    
    $button3.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 368
    $System_Drawing_Point.Y = 58
    $button3.Location = $System_Drawing_Point
    $button3.Name = "button3"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 22
    $System_Drawing_Size.Width = 24
    $button3.Size = $System_Drawing_Size
    $button3.TabIndex = 6
    $button3.Text = "..."
    $button3.UseVisualStyleBackColor = $True
    
    $form1.Controls.Add($button3)
    
    $textBox2.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 97
    $System_Drawing_Point.Y = 59
    $textBox2.Location = $System_Drawing_Point
    $textBox2.Name = "textBox2"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 271
    $textBox2.Size = $System_Drawing_Size
    $textBox2.TabIndex = 5
    
    $form1.Controls.Add($textBox2)
    
    $label2.DataBindings.DefaultDataSourceUpdateMode = 0
    $label2.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 61
    $label2.Location = $System_Drawing_Point
    $label2.Name = "label2"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 100
    $label2.Size = $System_Drawing_Size
    $label2.TabIndex = 4
    $label2.Text = "Destination:"
    
    $form1.Controls.Add($label2)
    
    $textBox1.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 97
    $System_Drawing_Point.Y = 17
    $textBox1.Location = $System_Drawing_Point
    $textBox1.Name = "textBox1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 87
    $textBox1.Size = $System_Drawing_Size
    $textBox1.TabIndex = 3
    
    $form1.Controls.Add($textBox1)
    
    $label1.DataBindings.DefaultDataSourceUpdateMode = 0
    $label1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",9.75,0,3,1)
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 18
    $label1.Location = $System_Drawing_Point
    $label1.Name = "label1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 21
    $System_Drawing_Size.Width = 50
    $label1.Size = $System_Drawing_Size
    $label1.TabIndex = 2
    $label1.Text = "Type:"
    
    $form1.Controls.Add($label1)
    
    $button2.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 222
    $System_Drawing_Point.Y = 206
    $button2.Location = $System_Drawing_Point
    $button2.Name = "button2"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 75
    $button2.Size = $System_Drawing_Size
    $button2.TabIndex = 1
    $button2.Text = "Cancel"
    $button2.UseVisualStyleBackColor = $True
    
    $form1.Controls.Add($button2)
    
    $button1.DataBindings.DefaultDataSourceUpdateMode = 0
    
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 313
    $System_Drawing_Point.Y = 206
    $button1.Location = $System_Drawing_Point
    $button1.Name = "button1"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 75
    $button1.Size = $System_Drawing_Size
    $button1.TabIndex = 0
    $button1.Text = "Save"
    $button1.UseVisualStyleBackColor = $True
    
    $form1.Controls.Add($button1)
    
    $form1.add_Load($OnLoadForm_StateCorrection)
    
    return $form1
    
    }