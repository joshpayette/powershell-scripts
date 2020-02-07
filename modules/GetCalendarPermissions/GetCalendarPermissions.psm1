<#
.SYNOPSIS
  This module lists the permissions for a user's calendar

.DESCRIPTION
  This module lists the permissions for a user's calendar

.PARAMETER userName
  The name of the user whose calendar is being checked

.EXAMPLE
  GetCalendarPermissions

.EXAMPLE
  GetCalendarPermissions -user "John Doe"
#>
function GetCalendarPermissions {
  param(
    [string] $user
  )

  if ($user -eq "") {
    $user = Read-Host -Prompt "Which user calendar would you like to check for permissions?"
  }
  
  Get-MailboxFolderPermission "$($user):\Calendar" | Select-Object FolderName, User, AccessRights

}

Export-ModuleMember -Function GetCalendarPermissions