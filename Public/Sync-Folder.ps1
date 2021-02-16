function Sync-Folder {
  [CmdletBinding(SupportsShouldProcess = $True)]
  Param(
    [Parameter(
      Mandatory = $true,
      ValueFromPipeline = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0
    )]
    [string]$Source,
    [Parameter(
      Mandatory = $true,
      ValueFromPipeline = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 1
    )]
    [string]$Target
  )


  Get-ChildItem $Source -Directory -Recurse | ForEach-Object {
    # create new folder path
    Write-Host "DirectoryName: $_ | Source: $Source | Target: $Target"
    $newPath = $_.FullName.Replace($Source, $Target)
    # create if not exists
    if (!(Test-path $newPath)) {
      mkdir $newPath 
    }
    Write-Host $_.FullName
    # Copy source file to target folder
    Copy-Item $_.FullName $newPath -Force
  }
}
