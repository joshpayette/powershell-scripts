<#
    Description:
        Check calendar permissions for a user
#>

param([Parameter()][string]$userWithCalendar)

if ($userWithCalendar -eq "") {
  $userWithCalendar = Read-Host -Prompt "Which user calendar would you like to check for permissions?"
}

Get-MailboxFolderPermission "$($userWithCalendar):\Calendar" | Select-Object FolderName, User, AccessRights