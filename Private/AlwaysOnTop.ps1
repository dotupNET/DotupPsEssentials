
# $signature = @"
	
# 	[DllImport("user32.dll")]  
# 	public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);  

# 	public static IntPtr FindWindow(string windowName){
# 		return FindWindow(null,windowName);
# 	}

# 	[DllImport("user32.dll")]
# 	public static extern bool SetWindowPos(IntPtr hWnd, 
# 	IntPtr hWndInsertAfter, int X,int Y, int cx, int cy, uint uFlags);

# 	[DllImport("user32.dll")]  
# 	public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow); 

# 	static readonly IntPtr HWND_TOPMOST = new IntPtr(-1);
# 	static readonly IntPtr HWND_NOTOPMOST = new IntPtr(-2);

# 	const UInt32 SWP_NOSIZE = 0x0001;
# 	const UInt32 SWP_NOMOVE = 0x0002;

# 	const UInt32 TOPMOST_FLAGS = SWP_NOMOVE | SWP_NOSIZE;

# 	public static void MakeTopMost (IntPtr fHandle)
# 	{
# 		SetWindowPos(fHandle, HWND_TOPMOST, 0, 0, 0, 0, TOPMOST_FLAGS);
# 	}

# 	public static void MakeNormal (IntPtr fHandle)
# 	{
# 		SetWindowPos(fHandle, HWND_NOTOPMOST, 0, 0, 0, 0, TOPMOST_FLAGS);
# 	}
# "@


# $app = Add-Type -MemberDefinition $signature -Name Win32Window -Namespace ScriptFanatic.WinAPI -ReferencedAssemblies System.Windows.Forms -Using System.Windows.Forms -PassThru

# function Set-AlwaysOnTop {
#   param(

#     [int][Alias('MainWindowHandle')]$windowHandle = 0,
#     [string]$MainWindowTitle,
#     [Parameter()][switch]$Disable
#   )
	
#   if (windowHandle -ne 0) {
#     if ($Disable) {
#       Write-Verbose "Set window :windowHandle to NORMAL state"
#       $null = $app::MakeNormal($windowHandle)
#       return
#     }
		
#     Write-Verbose "Set window :windowHandle to TOPMOST state"
#     $null = $app::MakeTopMost($windowHandle)
#   }
#   else {
#     Write-Verbose "windowHandle is 0"
#   }
# }

# function getOpenApplications() {

#   $openApplications = Get-Process | Where-Object { $_.MainWindowTitle -ne "" } | Select-Object MainWindowTitle

#   #This block was for getting a windows explorer window, which supposedlly didn't get caught in the above line, but it is...
#   #$a = New-Object -com "Shell.Application"
#   #$b = $a.windows() | select-object LocationName
#   #$c = "Windows Explorer: " + $b.LocationName
#   #$openApplications += $c

#   return $openApplications
# }

# function Get-WindowByTitle($WindowTitle = "*") {
#   Write-Verbose "WindowTitle is: $WindowTitle"
	
#   if ($WindowTitle -eq "*") {
#     Write-Verbose "WindowTitle is *, print all windows title"
#     Get-Process | Where-Object { $_.MainWindowTitle } | Select-Object Id, Name, MainWindowHandle, MainWindowTitle
#   }
#   else {
#     Write-Verbose "WindowTitle is $WindowTitle"
#     Get-Process | Where-Object { $_.MainWindowTitle -like "*$WindowTitle*" } | Select-Object Id, Name, MainWindowHandle, MainWindowTitle
#   }
# }


# function forceApplicationOnTop($chosenApplication) {

#   #Exaples:

#   # set powershell console on top of other windows 
#   #gps powershell | Set-AlwaysOnTop 

#   # unset
#   #gps powershell | Set-AlwaysOnTop -disable


#   # set an application on top of other windows by its windows title (wildcard is supported)
#   #Get-WindowByTitle *pad* | Set-AlwaysOnTop 

#   # unset
#   #Get-WindowByTitle textpad | Set-AlwaysOnTop -Disable

#   Write-Host "Chosen Window: "$chosenApplication

#   $openApplications = getOpenApplications
    
#   $openApplications | ForEach-Object {
#     Get-WindowByTitle $_.MainWindowTitle | Set-AlwaysOnTop -Disable
#   }

#   Get-WindowByTitle $chosenApplication | Set-AlwaysOnTop 

# }

# # $openApplications = getOpenApplications
# # $chosenApplication = createDropdownBox($openApplications)
# # forceApplicationOnTop($chosenApplication)
