function onStart() {
    Start-Job -Name Job1 -ScriptBlock({
        while($True){
            New-Item -Path "C:\Users\Bim Bababi\Desktop\Neuer Ordner" -Name(-join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})) -ItemType "directory"
            sleep(1)
        }
    })
    Get-Job | Receive-Job
}
    
function onStop(){
     
}