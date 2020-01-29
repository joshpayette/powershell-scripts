<#
  Description:
    Removes a user's photo from their account
#>
$userWithPhoto = Read-Host -Prompt "Which user should have their photo removed?"
Remove-UserPhoto $userWithPhoto