<#
.SYNOPSIS
  Creates manifest files for each module

.DESCRIPTION
  Creates manifest files for each module

.EXAMPLE
  . .\create-module-manifests
#>
$source = ".\modules\"

# Gather list of modules to install
$moduleDirectories = Get-ChildItem $source

# Loop through module folders and install them
foreach ($moduleDirectory in $moduleDirectories) {
  Write-Output "Creating manifest for $moduleDirectory module..."
  $manifest = @{
    Path       = "$source\$moduleDirectory\$moduleDirectory.psd1"
    RootModule = "$moduleDirectory.psm1"
    Author     = "Josh Payette"
  }
  New-ModuleManifest @manifest
}

# Success message
Write-Output "Module manifests successfully installed!"