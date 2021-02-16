function Get-RemoteCommands {

  Get-Command | Where-Object { $_.parameters.keys -contains "ComputerName" -and $_.parameters.keys -notcontains "Session" }

}
