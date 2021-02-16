function Get-ProcessByTitle {
  param(
    [Parameter(
      Mandatory = $true,
      ValueFromPipeline = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0
    )]
    [string]$MainWindowTitle
  )
  
  Write-Debug "MainWindowTitle is $MainWindowTitle"
	
  return Get-Process | Where-Object { $_.MainWindowTitle -eq $MainWindowTitle }
}
