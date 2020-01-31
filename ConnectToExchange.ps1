<#
.SYNOPSIS
  This script opens a connection to Office 365 Exchange

.DESCRIPTION
  This script opens a connection to Office 365 Exchange

.EXAMPLE
  . .\ConnectToExchange
#>

try {
  $credential = Get-Credential -ErrorAction Stop
}
catch {
  Write-Warning -Message "There was an error with the user credentials provided!"
}

try {
  $exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid" -Credential $credential -Authentication "Basic" -AllowRedirection
  Import-PSSession $exchangeSession
    
  # Write success message
  Write-Output "Successfully connected to Exchange!"
}
catch {
  Write-Warning -Message "There was an error when connecting to the Exchange server!"
}
