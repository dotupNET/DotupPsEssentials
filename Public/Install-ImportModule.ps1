function Install-ImportModule {
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
    Import-Module $ModuleName;
  }
  else {
    Install-Module $ModuleName;
    Import-Module $ModuleName;
  }

  Get-Command -Module $ModuleName;
}