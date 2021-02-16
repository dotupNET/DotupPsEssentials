function Disable-Telemetry {

  # Stop and Disable DiagTrack Service
  Get-Service -Name DiagTrack | Set-Service -Status Stopped -StartupType Disabled 

  # Stop and Disable dmwappushservice Service
  Get-Service -Name dmwappushservice | Set-Service -Status Stopped -StartupType Disabled 

  # Disable Perfmon DiagTrack entry
  Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener\ -name Start -Value 0

  # Disable DataCollection entry
  Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection\ -name AllowTelemetry -Value 0

  # Disable Wifi Sense
  Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features\ -name WiFiSenseCredShared -Value 0
  Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features\ -name WiFiSenseOpen -Value 0

  # Disable Wifi Sense on newer Windows 10
  $path = "\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features"
  Get-ChildItem HKLM:$path  | Where-Object { $_.Name.EndsWith("-1000") } | Set-ItemProperty -name FeatureStates -Value 0

  # https://www.pcwelt.de/a/bundesamt-fuer-it-sicherheit-bsi-untersucht-sicherheit-von-windows-10,3463082


  # „HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search” und ändern dort den Wert bei „AllowCortana“ auf 0. Sollte der Schlüssel oder der Eintrag nicht existieren, dann müssen Sie ihn jeweils manuell anlegen.

  # https://intermundien.de/windows-sicherheitseinschraenkung-feeback-und-diagnose-ueber-gpo/
}

# $trigger = New-JobTrigger -AtStartup -RandomDelay 00:00:30
# Register-ScheduledJob -Trigger $trigger -FilePath C:\temp\Disable-Telemetry.ps1 -Name DisableTelemetry
