function Get-WindowByTitle {
  [CmdletBinding()]
  [Parameter(
    Mandatory = $true,
    ValueFromPipeline = $true,
    ValueFromPipelineByPropertyName = $true,
    Position = 0
  )]
  [string]$MainWindowTitle

  Write-Debug "MainWindowTitle is $MainWindowTitle"

  return Get-Process | Where-Object { $_.MainMainWindowTitle -like "*$MainWindowTitle*" } | Select-Object Id, Name, MainWindowHandle, MainMainWindowTitle
}
