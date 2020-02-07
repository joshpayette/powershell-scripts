<#
.SYNOPSIS
  Generate a list of users with a particular license type

.DESCRIPTION
  Generates a CSV file containing a list of users with a specified license type.  If no 
  license name is provided, a list of ACCOUNT SKUs will be returned that can be passed as 
  the license parameter.

.PARAMETER license
  The name of the license to use as a filter on the user list

.EXAMPLE
  GetUsersByLicenseType

.EXAMPLE
  GetUsersByLicenseType -license sometest:ENTERPRISEPACK
#>
function GetUsersByLicenseType {
  param(
    [string] $license
  )

  # The output location for the CSV
  $desktopPath = [Environment]::GetFolderPath("Desktop")
  $outFilePath = "$desktopPath/GetUsersByLicenseType.csv"

  # Prompt for license name if not provided
  if ($license -eq "") {
    Get-MsolAccountSku
  }
  else {
    # Gather and filter the user list
    Get-MsolUser | Where-Object { ($_.licenses).AccountSkuId -match $license } | Export-Csv -Path $outFilePath
  }
}

Export-ModuleMember -Function GetUsersByLicenseType