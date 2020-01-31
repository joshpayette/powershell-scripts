<#
.SYNOPSIS
  This module connects to Office 365 Exchange

.DESCRIPTION
  This module connects to Office 365 Exchange

.EXAMPLE
  ConnectToExchange
#>
function ConnectToExchange {
  param()
  
  # Prompt for user credentials
  try {
    $credential = Get-Credential -ErrorAction Stop
  }
  catch {
    Write-Warning -Message "There was an error with the provided credentials."
  }


  # Connect to Exchange using provided credentials
  try {
    Write-Output "Connecting to Exchange..."
    $exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection -ErrorAction Stop
    Import-PSSession $exchangeSession -DisableNameChecking
    
    # Write success message
    Write-Output "Successfully connected to Exchange!"
  }
  catch {
    Write-Warning -Message "There was an error connecting to Exchange."
  }


}

Export-ModuleMember -Function ConnectToExchange