# $SQLServer = Get-JoinIf $InstanceName @($ServerName, "\", $InstanceName) $ServerName
function  Get-JoinIf {
  param (
    [string]$condition,
    [string[]]$trueResult,
    [string]$falseResult
  )

  # ForEach ( $item in $trueResult ) {
  #   Write-Debug $item
  # }

  if ($condition) {
    return [string]::Join("", $trueResult)
  }
  else {
    $falseResult 
  }
}
