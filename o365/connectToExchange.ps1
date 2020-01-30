<#
  Description:
    Connects to your Exchange environment
#>
$credential = Get-Credential

$exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection
Import-PSSession $exchangeSession -DisableNameChecking

Write-Output "Successfully connected to Exchange!"