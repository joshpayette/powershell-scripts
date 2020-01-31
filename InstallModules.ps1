<#
.SYNOPSIS
  Installs all modules on the local machine

.DESCRIPTION
  Installs all modules on the local machine

.EXAMPLE
  . .\install
#>

$source = ".\modules\"
$destination = "$Home\Documents\WindowsPowerShell\Modules\"

# Gather list of modules to install
$moduleDirectories = Get-ChildItem $source

# Loop through module folders and install them
foreach ($moduleDirectory in $moduleDirectories) {
  Write-Output "Installing $moduleDirectory module..."
  Remove-Item "$destination\$moduleDirectory\" -Recurse -ErrorAction Ignore
  Copy-Item -Path "$source\$moduleDirectory" -Destination $destination -Recurse
}

# Success message
Write-Output "Modules successfully installed!"