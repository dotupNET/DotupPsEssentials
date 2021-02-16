function Get-JaNein {
  Param(
    [Parameter(Mandatory = $true)] [string]$Question,
    [string]$DefaultAnswer
  )

  if (!$DefaultAnswer) {
    $DefaultAnswer = "n";
  }

  $Question = "$($Question) | Ja<j> Nein<n>";

  $result = Get-Answer $Question $DefaultAnswer;

  if ($result -eq "j") {
    $true;    
  }
  else {
    $null
  }
}