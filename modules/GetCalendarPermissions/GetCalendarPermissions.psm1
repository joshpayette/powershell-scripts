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
  GetCalendarPermissions -userName "John Doe"
#>
function GetCalendarPermissions {
  param(
    [string] $userName
  )

  if ($userName -eq "") {
    $userName = Read-Host -Prompt "Which user calendar would you like to check for permissions?"
  }
  
  Get-MailboxFolderPermission "$($userName):\Calendar" | Select-Object FolderName, User, AccessRights

}

Export-ModuleMember -Function GetCalendarPermissions