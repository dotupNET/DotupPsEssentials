function  Get-DayOfWeekShort {
  [OutputType([String])]
  param (
    [datetime]$date = (Get-Date)
  )

  switch (  [Int]  $date.DayOfWeek) {
    0 { return "So" }
    1 { return "Mo" }
    2 { return "Di" }
    3 { return "Mi" }
    4 { return "Do" }
    5 { return "Fr" }
    6 { return "Sa" }
    Default {
      Write-Error "Date: $date | DayOfWeek: $($date.DayOfWeek) ($([Int]$($date.DayOfWeek)))"
      throw "Could not determine day of week" 
    }
  }
}