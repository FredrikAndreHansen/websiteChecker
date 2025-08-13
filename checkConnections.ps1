function Check-Connection {
    param($URL);

    if (Test-Connection -ComputerName $URL -Count 1 -Quiet) {
        return $true;
    } else {
        return $false;
    }
}

function Get-NS-Formatted {
    param($URL);

    $NSLookupOutput = nslookup -type=ns $URL | Select-String "nameserver = ";
    $Format = -split $NSLookupOutput;
    $MainNameServer = $Format[3];
    $SecondNameServer = $Format[7];

    if ($Format.Length -eq 0) {
        return "Error: Cant find any nameservers";
    }

    return "Main nameserver: " + $MainNameServer + " - Secondary: " + $SecondNameServer;
}

function Get-MX-Formatted {
    param($URL);

    $NSLookupOutput = nslookup -type=mx $URL | Select-String "exchanger = ";
    $Format = -split $NSLookupOutput;
    $MailExchange = $Format[8];

    if ($Format.Length -eq 0) {
        return "Error: Cant find mail exchanger";
    }

    return "Mail exchanger: " + $MailExchange;
}