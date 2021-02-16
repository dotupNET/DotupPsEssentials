function Get-Option {
  [CmdletBinding()]
  [OutputType([int])]
  Param
  (
    [Parameter(
      Mandatory = $true,
      ValueFromPipeline = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0
    )]
    $Options,
    [string]$Title,
    $Selected,
    [switch]$Required
  )

  Begin {
    $index = 1;
    [string[]]$temp = @();
    if ($Title) {
      Write-Host $Title;
    }
  }
  
  Process {
    foreach ($item in $Options) {

      if ($Selected) {
        $isSelected = switch ($Selected -eq $item) {
          $true { "x" }
          Default { " " }
        }
        Write-Host "($isSelected) $($index): $item"
      }
      else {
        Write-Host "$($index): $item"
      }
      $temp += $item;
      $index += 1;

    }

  }

  End {

    if ($Required) {
      $read = Get-Answer "Auswahl" -DefaultAnswer $Selected -AnswerRequired;
    }
    else {
      $read = Get-Answer "Auswahl" -DefaultAnswer $Selected;
    }
    
    if($read -gt $temp.Count)
    {
      Write-Error "Ungültige Auswahl";
    } else {
      $temp[$read-1];
    }

  }
}
