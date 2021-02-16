#
# Modulmanifest für das Modul "PSGet_DotupPsEssentials"
#
# Generiert von: Peter Ullrich
#
# Generiert am: 10.08.2020
#

@{

# Die diesem Manifest zugeordnete Skript- oder Binärmoduldatei.
RootModule = 'DotupPsEssentials.psm1'

# Die Versionsnummer dieses Moduls
ModuleVersion = '1.0.67'

# Unterstützte PSEditions
# CompatiblePSEditions = @()

# ID zur eindeutigen Kennzeichnung dieses Moduls
GUID = '9731b8cb-beee-4c9c-9296-8e0037fd2dbf'

# Autor dieses Moduls
Author = 'Peter Ullrich'

# Unternehmen oder Hersteller dieses Moduls
CompanyName = 'dotup IT solutions'

# Urheberrechtserklärung für dieses Modul
Copyright = '(c) 2019 Peter Ullrich. Alle Rechte vorbehalten.'

# Beschreibung der von diesem Modul bereitgestellten Funktionen
Description = 'PowerShell essential functions'

# Die für dieses Modul mindestens erforderliche Version des Windows PowerShell-Moduls
# PowerShellVersion = ''

# Der Name des für dieses Modul erforderlichen Windows PowerShell-Hosts
# PowerShellHostName = ''

# Die für dieses Modul mindestens erforderliche Version des Windows PowerShell-Hosts
# PowerShellHostVersion = ''

# Die für dieses Modul mindestens erforderliche Microsoft .NET Framework-Version. Diese erforderliche Komponente ist nur für die PowerShell Desktop-Edition gültig.
# DotNetFrameworkVersion = ''

# Die für dieses Modul mindestens erforderliche Version der CLR (Common Language Runtime). Diese erforderliche Komponente ist nur für die PowerShell Desktop-Edition gültig.
# CLRVersion = ''

# Die für dieses Modul erforderliche Prozessorarchitektur ("Keine", "X86", "Amd64").
# ProcessorArchitecture = ''

# Die Module, die vor dem Importieren dieses Moduls in die globale Umgebung geladen werden müssen
# RequiredModules = @()

# Die Assemblys, die vor dem Importieren dieses Moduls geladen werden müssen
# RequiredAssemblies = @()

# Die Skriptdateien (PS1-Dateien), die vor dem Importieren dieses Moduls in der Umgebung des Aufrufers ausgeführt werden.
# ScriptsToProcess = @()

# Die Typdateien (.ps1xml), die beim Importieren dieses Moduls geladen werden sollen
# TypesToProcess = @()

# Die Formatdateien (.ps1xml), die beim Importieren dieses Moduls geladen werden sollen
# FormatsToProcess = @()

# Die Module, die als geschachtelte Module des in "RootModule/ModuleToProcess" angegebenen Moduls importiert werden sollen.
# NestedModules = @()

# Aus diesem Modul zu exportierende Funktionen. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und löschen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Funktionen vorhanden sind.
FunctionsToExport = 'Disable-Telemetry', 'Get-Answer', 'Get-DayOfWeekShort', 
               'Get-DecryptedText', 'Get-EncryptedText', 'Get-HugeFiles', 'Get-IfNull', 
               'Get-JaNein', 'Get-JoinIf', 'Get-Option', 'Get-ProcessByTitle', 
               'Get-RemoteCommands', 'Get-Selection', 'GetResult', 'Get-WindowByTitle', 
               'Install-ImportModule', 'Remove-Folder', 'Set-AlwaysOnTop', 
               'Sync-Folder', 'Uninstall-InstallModule'

# Aus diesem Modul zu exportierende Cmdlets. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und löschen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Cmdlets vorhanden sind.
CmdletsToExport = '*'

# Die aus diesem Modul zu exportierenden Variablen
VariablesToExport = '*'

# Aus diesem Modul zu exportierende Aliase. Um optimale Leistung zu erzielen, verwenden Sie keine Platzhalter und löschen den Eintrag nicht. Verwenden Sie ein leeres Array, wenn keine zu exportierenden Aliase vorhanden sind.
AliasesToExport = @()

# Aus diesem Modul zu exportierende DSC-Ressourcen
# DscResourcesToExport = @()

# Liste aller Module in diesem Modulpaket
# ModuleList = @()

# Liste aller Dateien in diesem Modulpaket
# FileList = @()

# Die privaten Daten, die an das in "RootModule/ModuleToProcess" angegebene Modul übergeben werden sollen. Diese können auch eine PSData-Hashtabelle mit zusätzlichen von PowerShell verwendeten Modulmetadaten enthalten.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '
          1.0.0: 
            -Get-Answer
          1.0.1:
            -Function export Get-Answer
          1.0.2:
            -Get-JaNein
          1.0.3:
            -Export *
          1.0.5:
            -Uninstall-Install-Module
          1.0.6:
            -Get-JaNein
          1.0.7:
            -Get-JaNein
          1.0.8:
            -Uninstall-Install-Module
          1.0.9:
            -Uninstall-InstallModule
          1.0.10:
            -Get-JaNein
          1.0.11:
            -Get-JaNein returns null if no is the answer
          1.0.12:
            -Split functions into files
          1.0.16:
            -Get-EncryptedText
            -Get-DecryptedText
            -Install-ImportModule
          1.0.18:
            -Remove-Folder
          1.0.37:
            -Get-ProcessWindowTitles
            -Get-WindowByTitle
            -Get-HugeFiles
          1.0.49:
            -Sync-Folder
          1.0.58:
            -Disable-Telemetry
          1.0.60:
            -Get-RemoteCommands
        '

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

 } # End of PrivateData hashtable

# HelpInfo-URI dieses Moduls
# HelpInfoURI = ''

# Standardpräfix für Befehle, die aus diesem Modul exportiert werden. Das Standardpräfix kann mit "Import-Module -Prefix" überschrieben werden.
# DefaultCommandPrefix = ''

}

