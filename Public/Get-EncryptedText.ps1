function Get-EncryptedText {
  [CmdletBinding()]
  [OutputType([string])]
  Param
  (
    [Parameter(
      Mandatory = $true,
      ValueFromPipeline = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0
    )]
    [string]$Value,
    [Parameter(
      Mandatory = $false,
      ValueFromPipeline = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 1
    )]
    [string]$Key
  )
  
  Process {
    if ($Key) {
      $enc = [system.Text.Encoding]::UTF8
      $keyBytes = ($enc.GetBytes($key))
    }
    $encrypted = ConvertTo-SecureString -String $value -AsPlainText -Force | ConvertFrom-SecureString -Key $keyBytes;
    $encrypted
  }

}
