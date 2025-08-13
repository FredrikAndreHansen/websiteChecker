$GUI = New-Object System.Windows.Forms.Form;

$GUI.ClientSize = "500, 500";
$GUI.Text = "Website Checker";
$GUI.BackColor = "#FFFFFF";
$GUI.AutoScroll = $true;

function Draw-Website-Background {
    param($WebsiteIndex, $URL);

    $YPosition = Calculate-Y-Position -WebsiteIndex $WebsiteIndex;

    $WebsiteLabel.Location = New-Object System.Drawing.Point(10, $YPosition);
    $WebsiteLabel.AutoSize = $true;
    $WebsiteLabel.Padding = 4;
    $WebsiteLabel.Font = New-Object System.Drawing.Font("Arial", 14);
    $WebsiteLabel.ForeColor = "#FFFFFF";
}


function Calculate-Y-Position {
    param($WebsiteIndex);

    return (10 + ($WebsiteIndex * 130));
}

function Draw-Website-Result {
    param($IsConnected, $URL);

    if ($IsConnected -eq $true) {
        $Status = "OK";
        $Color = "#228B22";
    } else {
        $Status = "Error";
        $Color = "#B22222";
    }

    $WebsiteLabel.BackColor = $Color;
    $WebsiteLabel.Text = $URL + " (Status: " + $Status + ")";

    $GUI.Controls.Add($WebsiteLabel);
}

function Draw-NS-Records {
    param($WebsiteIndex, $URL);

    $YPosition = Calculate-Y-Position -WebsiteIndex $WebsiteIndex;

    $NSLabel.Location = New-Object System.Drawing.Point(10, ($YPosition + 40));
    $NSLabel.AutoSize = $true;
    $NSLabel.Padding = 4;
    $NSLabel.Font = New-Object System.Drawing.Font("Arial", 8);
    $NSLabel.ForeColor = "#FFFFFF";

    $NSLabel.BackColor = "#202030";
    
    $NSFormattedText = Get-NS-Formatted -URL $URL;

    $NSLabel.Text = $NSFormattedText;

    $GUI.Controls.Add($NSLabel);
}

function Draw-MX-Records {
    param($WebsiteIndex, $URL);

    $YPosition = Calculate-Y-Position -WebsiteIndex $WebsiteIndex;

    $MXLabel.Location = New-Object System.Drawing.Point(10, ($YPosition + 70));
    $MXLabel.AutoSize = $true;
    $MXLabel.Padding = 4;
    $MXLabel.Font = New-Object System.Drawing.Font("Arial", 8);
    $MXLabel.ForeColor = "#FFFFFF";

    $MXLabel.BackColor = "#303040";
    
    $MXFormattedText = Get-MX-Formatted -URL $URL;

    $MXLabel.Text = $MXFormattedText;

    $GUI.Controls.Add($MXLabel);
}

function Display-GUI {
    $GUI.ShowDialog();

    $GUI.Dispose();
}