<#
.SYNOPSIS
  Assign full access to a mailbox with automapping disabled

.DESCRIPTION
  Assigns full delegate access for a user to another user's mailbox,
  with automapping disabled so that it doesn't pull into Outlook.

  Must be run from Exchange Online PowerShell Module!!!

.PARAMETER mailbox
  The name of the mailbox to grant access to

.PARAMETER user
  The user to give full access to

.EXAMPLE
  AddDelegateAccess

.EXAMPLE
  AddDelegateAccess -adminAccount testadmin@test.com -mailbox test@test.com -user testuser@test.com
#>
function AddDelegateAccess {
  param(
    [Parameter(Mandatory = $true)]
    [string] $adminAccount,
    [Parameter(Mandatory = $true)]
    [string] $mailbox,
    [Parameter(Mandatory = $true)]
    [string] $user
  )

  Connect-EXOPSSession -UserPrincipalName $adminAccount
  Add-MailboxPermission -Identity $mailbox -User $user -AccessRights FullAccess -AutoMapping:$false
}

Export-ModuleMember -Function AddDelegateAccess