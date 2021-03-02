<#
.SYNOPSIS
  Assign full access to a mailbox with automapping disabled

.DESCRIPTION
  Assigns full delegate access for a user to another user's mailbox,
  with automapping disabled so that it doesn't pull into Outlook

.PARAMETER mailbox
  The name of the mailbox to grant access to

.PARAMETER user
  The user to give full access to

.EXAMPLE
  AddDelegateAccess

.EXAMPLE
  AddDelegateAccess -mailbox test@test.com -user testuser@test.com
#>
function AddDelegateAccess {
  param(
    [Parameter(Mandatory=$true)]
    [string] $mailbox,
    [Parameter(Mandatory=$true)]
    [string] $user
  )

  Connect-EXOPSSession -UserPrincipalName josh@raffafinancial.com
  Add-MailboxPermission -Identity $mailbox -User $user -AccessRights FullAccess -AutoMapping:$false
}

Export-ModuleMember -Function AddDelegateAccess