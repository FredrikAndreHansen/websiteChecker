Add-Type -AssemblyName System.Windows.Forms

$FullPath = "C:\Users\Fredrik\CustomDesktop\WebDev\PowerShell\website_checker";
. $FullPath\drawGui.ps1;
. $FullPath\checkConnections.ps1;

$AllURLs = @("nomadcyber.ai", "yggdrasilservices.com");
    
$currentDate = Get-Date -Format "HH:mm:ss";

for($i = 0; $i -lt $AllURLs.Length; $i++) {
    
    $WebsiteLabel = New-Object System.Windows.Forms.Label;
    $NSLabel = New-Object System.Windows.Forms.Label;
    $MXLabel = New-Object System.Windows.Forms.Label;
    
    Draw-Website-Background -WebsiteIndex $i -URL $AllURLs[$i];
    
    $IsConnected = Check-Connection -URL $AllURLs[$i];

    Draw-Website-Result -IsConnected $IsConnected -URL $AllURLs[$i];

    Draw-NS-Records -WebsiteIndex $i -URL $AllURLs[$i];

    Draw-MX-Records -WebsiteIndex $i -URL $AllURLs[$i];
}

Display-GUI;