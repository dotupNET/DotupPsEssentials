# Get-HugeFiles -Path c:\temp | Out-String | Format-Table -AutoSize

function Get-HugeFiles {
  Param(
    [string]$Path = $pwd,
    [int]$SizeInMB = 100,
    [int]$ResultLimit = 10000
  )

  $folders = Get-ChildItem -Path $Path -Directory -Recurse -ErrorAction SilentlyContinue | Where-Object { !($_.Attributes -match "ReparsePoint") }

  $hugeFiles = @()

  foreach ($folder in $folders) {
    $cur = Join-Path $Path $folder
    $size = @{Name = "Size(MB)"; expression = { [Math]::round($_.length / 1MB, 2) } }
    $hugeFiles += Get-ChildItem -File -Path "$cur" -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.length -gt ($SizeInMB * 1MB) } | Sort-Object -Property length -Descending | Select-Object FullName, $size

    if ($hugeFiles.length -ge $ResultLimit) {
      break
    }
  }

  return $hugeFiles # | Out-String | Format-Table -AutoSize
}
