<#
.SYNOPSIS
  This script opens a connection to various Office365 services

.DESCRIPTION
  This script opens a connection to various Office365 services

.EXAMPLE
  . .\ConnectToExchange
#>

# Get user credentials
try {
  $credential = Get-Credential -ErrorAction Stop
}
catch {
  Write-Warning -Message "There was an error with the user credentials provided!"
}

# Connect to Exchange
try {
  $exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid" -Credential $credential -Authentication "Basic" -AllowRedirection
  Import-PSSession $exchangeSession
    
  # Write success message
  Write-Output "Successfully connected to Exchange!"
}
catch {
  Write-Warning -Message "There was an error when connecting to the Exchange server!"
}

# Connect to AzuareAD
try {
  Connect-AzureAD -Credential $credential

  # Write success message
  Write-Output "Successfully connected to AzureAD!"
}
catch {
  Write-Warning -Message "There was an error when connecting to the AzureAD server!"
}

# Connect to MSOL
try {
  Connect-MsolService -Credential $credential

  # Write success message
  Write-Output "Successfully connected to MSOL!"
}
catch {
  Write-Warning -Message "There was an error when connecting to the MSOL server!"
}