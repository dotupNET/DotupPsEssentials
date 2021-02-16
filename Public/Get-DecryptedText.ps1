function Get-DecryptedText {
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
    try {
      if ($Key) {
        $enc = [system.Text.Encoding]::UTF8
        $keyBytes = ($enc.GetBytes($key))
      }
      $securestring = ConvertTo-SecureString -string $Value -Key $keyBytes
      $bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securestring)
      [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)
    }
    catch [System.Security.Cryptography.CryptographicException] {
      $null
    }
  }

}
