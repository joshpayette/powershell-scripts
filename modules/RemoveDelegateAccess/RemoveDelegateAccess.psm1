<#
.SYNOPSIS
  Remove access to a mailbox

.DESCRIPTION
  Removes delegate access for a user to another user's mailbox
  
  Must be run from Exchange Online PowerShell Module!!!

.PARAMETER mailbox
  The name of the mailbox to remove access from

.PARAMETER user
  The user to remove access for

.EXAMPLE
  RemoveDelegateAccess

.EXAMPLE
  RemoveDelegateAccess -mailbox test@test.com -user testuser@test.com
#>
function RemoveDelegateAccess {
  param(
    [Parameter(Mandatory = $true)]
    [string] $mailbox,
    [Parameter(Mandatory = $true)]
    [string] $user
  )



  Connect-EXOPSSession -UserPrincipalName josh@raffafinancial.com
  Remove-MailboxPermission -Identity $mailbox -User $user -AccessRights FullAccess
}

Export-ModuleMember -Function RemoveDelegateAccess