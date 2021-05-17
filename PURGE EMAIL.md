# Purge an email from all mailboxes

1) Start Exchange Online Powershell module.

## Connect to Exchange

`Connect-IPPSSession -UserPrincipalName josh@raffafinancial.com`

## Create compliance search

`New-ComplianceSearch -Name COMPLIANCE_SEARCH_NAME -ExchangeLocation All -ContentMatchQuery 'subject:"You must change your bank password now" AND sent:05/12/2020'`

## Monitor status of search

Monitor until search shows completed.

`Get-ComplianceSearch -Identity COMPLIANCE_SEARCH_NAME`

### More detailed results

`New-ComplianceSearchAction -SearchName COMPLIANCE_SEARCH_NAME -Preview`

## Deleting the messages

`New-ComplianceSearchAction -SearchName COMPLIANCE_SEARCH_NAME -Purge -PurgeType HardDelete`