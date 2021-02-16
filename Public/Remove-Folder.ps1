# Remove-Folder C:\src\Beispiele @("node_modules", "npm-cache")
function Remove-Folder {
  [CmdletBinding(SupportsShouldProcess = $True)]
  Param(
    [string]$Path = $pwd,
    [Parameter(Mandatory = $true)] [string[]]$Names
  )

  $childs = Get-ChildItem $Path

  foreach ($item in $childs) {
    if ($item -is [System.IO.DirectoryInfo]) {
      $curDir = Join-Path $Path $item

      # $_ is the piped item value of $Names
      if ($Names | Where-Object { $item.Name -eq $_ }) {
        if ($WhatIfPreference) {
          Write-Host "$curDir would be deleted"
        }
        else {
          Remove-Item -Path $curDir -Recurse -Force
          Write-Host "$curDir deleted"
        }
      }
      else {
        # check subfolders
        Remove-Folder $curDir $Names -WhatIf:$WhatIfPreference
      }
    }
  }
}