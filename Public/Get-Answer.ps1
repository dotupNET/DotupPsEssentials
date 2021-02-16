function Get-Answer {
  Param(
    [Parameter(Mandatory = $true)] [string]$Question,
    [string]$DefaultAnswer,
    [switch]$AnswerRequired
  )

  if ($DefaultAnswer) {
    $Question = "$($Question) ($($DefaultAnswer))";
  }

  $value = Read-Host $Question;

  if (-Not $value) {
    $value = $DefaultAnswer;
  }

  if ((-Not $value) -and $AnswerRequired) {
    Write-Error "Error: Required answer is empty";
    break;
  }

  $value;
}