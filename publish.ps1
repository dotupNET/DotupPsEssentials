Import-Module DotupPsEssentials;
Import-Module DotupPsModuleGenerator;

$path = Get-Location;

$PowershellApiKey = "jo";
# Publish-PsModule -Path $path -APIKey $PowershellApiKey -IncrementVersion;

Publish-PsModule -Path $path -IncrementVersion;
