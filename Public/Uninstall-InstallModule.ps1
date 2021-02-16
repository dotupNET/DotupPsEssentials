function Uninstall-InstallModule {
  [CmdletBinding()]
  param (
    [Parameter(
      Mandatory = $true,
      ValueFromPipeline = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0
    )]
    [string]$ModuleName
  )

  if (Get-Module $ModuleName) {
    Remove-Module $ModuleName;
    Uninstall-Module $ModuleName;
  }
  Install-Module $ModuleName;
  Import-Module $ModuleName;

  Get-Command -Module $ModuleName;
}