Import-Module DotupPsEssentials;
Import-Module DotupPsModuleGenerator;

$path = Get-Location;
$PowershellApiKey = "oy2brhym6syjwgjiwnoqhnh56zx52pju7b27ravqwewwwy";
Publish-PsModule -Path $path -APIKey $PowershellApiKey -IncrementVersion;
