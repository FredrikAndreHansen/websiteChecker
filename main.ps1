$GUI = New-Object System.Windows.Forms.Form;
$GUI.ClientSize = "500, 300";
$GUI.Text = "Website Checker";
$GUI.BackColor = "#FFFFFF";

$AllURLs = @("nomadcyber.ai", "yggdrasilservsices.com");

for($i = 0; $i -lt $AllURLs.Length; $i++) {
    
    $WebsiteLabel = New-Object System.Windows.Forms.Label;
    
    $WebsiteLabel.Location = New-Object System.Drawing.Point(10, (10 + ($i * 50)));
    $WebsiteLabel.AutoSize = $true;
    $WebsiteLabel.Padding = 4;
    $WebsiteLabel.Font = New-Object System.Drawing.Font("Arial", 14);
    $WebsiteLabel.ForeColor = "#FFFFFF";
    
    if (Test-Connection -ComputerName $AllURLs[$i] -Count 1 -Quiet) {
        $Status = "OK";
        $Color = "#228B22";
    } else {
        $Status = "Error";
        $Color = "#B22222";
    }

    $WebsiteLabel.BackColor = $Color;
    $WebsiteLabel.Text = $AllURLs[$i] + " (Status: " + $Status + ")";

    $GUI.Controls.Add($WebsiteLabel);
}

$GUI.ShowDialog();

$GUI.Dispose();