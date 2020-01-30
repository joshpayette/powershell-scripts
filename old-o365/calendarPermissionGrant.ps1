<#
  Description:
    Grants a user permission on another user's calendar
#>

# Allowed permissions - Permission list: https://docs.microsoft.com/en-us/powershell/module/exchange/mailboxes/Add-MailboxFolderPermission?view=exchange-ps
$permissions = "Author", "Contributor", "Editor", "None", "NonEditingAuthor", "Owner", "PublishingAuthor", "PublishingEditor", "Reviewer"
# Prompt for the user with calendar to target
$userWithCalendar = Read-Host -Prompt "Which user calendar are we granting access to?"
# Prompt for the user to be granted permission
$userToGivePermission = Read-Host -Prompt "Which user should get permission to $($userWithCalendar)'s calendar?"

# Output all allowed permissions
Write-Output "
`n
==========================
  Available Permissions
==========================
$(foreach ($permission in $permissions) {
  Write-Output "  $($permission)`n"
})
"
# The user response to which permission to grant
$permissionToGrant = Read-Host -Prompt "What permission should $($userToGivePermission) get for $($userWithCalendar)'s calendar?"

# Ensure the permission is valid
if (-not ($permissions.Contains($permissionToGrant))) {
  Write-Output "The permission you selected is not valid."
  return
}

# Assign the permissions
Add-MailboxFolderPermission "$($userWithCalendar):\Calendar" -User $userToGivePermission -AccessRights $permissionToGrant
# Success message
Write-Output "$($permissionToGrant) permission was successfully granted to $($userToGivePermission) for $($userWithCalendar)'s calendar!"
# Output calendar permissions
Write-Output "
`n
================================================================
  Updated permissions for $($userWithCalendar):
================================================================
"
Invoke-Expression "& .\calendarPermissionCheck.ps1 -userWithCalendar $userWithCalendar"