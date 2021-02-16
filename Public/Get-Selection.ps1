function Get-Selection {
  [CmdletBinding()]
  [OutputType([String])]
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
    # $pad = $Options.length

    # ([string]$number).PadLeft($pad,'0')

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
    $read = $read.Replace(',', ' ');

    $result = GetResult $temp $read;
    return $result;
  }
}


function GetResult($items, $userInput) {
  [string[]]$result = @();
  $selections = $userInput.Split(' ');

  foreach ($index in $selections) {
    $result += $items[$index - 1];
  }
  $result;
}

# $windows = Get-Process | where-object { $_.MainWindowTitle -ne "" } | Select-Object -ExpandProperty MainWindowTitle;

# $o = @("a", "b", "c")
# Get-Selection $windows #| Write-Host

#Export-ModuleMember -Function Get-Selection
