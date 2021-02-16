$signature = @"
	
	[DllImport("user32.dll")]  
	public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);  

	public static IntPtr FindWindow(string windowName){
		return FindWindow(null,windowName);
	}

	[DllImport("user32.dll")]
	public static extern bool SetWindowPos(IntPtr hWnd, 
	IntPtr hWndInsertAfter, int X,int Y, int cx, int cy, uint uFlags);

	[DllImport("user32.dll")]  
	public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow); 

	static readonly IntPtr HWND_TOPMOST = new IntPtr(-1);
	static readonly IntPtr HWND_NOTOPMOST = new IntPtr(-2);

	const UInt32 SWP_NOSIZE = 0x0001;
	const UInt32 SWP_NOMOVE = 0x0002;

	const UInt32 TOPMOST_FLAGS = SWP_NOMOVE | SWP_NOSIZE;

	public static void MakeTopMost (IntPtr fHandle)
	{
		SetWindowPos(fHandle, HWND_TOPMOST, 0, 0, 0, 0, TOPMOST_FLAGS);
	}

	public static void MakeNormal (IntPtr fHandle)
	{
		SetWindowPos(fHandle, HWND_NOTOPMOST, 0, 0, 0, 0, TOPMOST_FLAGS);
	}
"@

function Set-AlwaysOnTop {
  [CmdletBinding()]
  param(
    [Parameter(
      # Mandatory = $true,
      ValueFromPipeline = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0
      # ParameterSetName = "ByHandle"
    )]
    [int]$MainWindowHandle,
    [Parameter(
      # Mandatory = $true,
      ValueFromPipeline = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 1
      # ParameterSetName = "ByTitle"
    )]
    [string]$MainWindowTitle,
    [Parameter()][switch]$Reset
  )

  if ($MainWindowHandle -eq 0) {

    if ([string]::IsNullOrEmpty($MainWindowTitle)) {

      $windowTitles = Get-Process | where-object { $_.MainWindowTitle  -ne ""} | Select-Object -ExpandProperty MainWindowTitle;

      $MainWindowTitle = Get-Selection $windowTitles -Required
      # throw "Neither MainWindowHandle nor MainWindowTitle specified"
    }

    $process = Get-ProcessByTitle $MainWindowTitle

    if ($process.MainWindowHandle -eq 0) {
      throw "Could not find window with title '$MainWindowTitle'"
    }

  }

  $app = Add-Type -MemberDefinition $signature -Name Win32Window -Namespace de.dotup -ReferencedAssemblies System.Windows.Forms -Using System.Windows.Forms -PassThru

  if ($Reset) {
    Write-Debug "Set window $process.MainWindowHandle to NORMAL state"
    $app::MakeNormal($process.MainWindowHandle)
  }
  else {
    Write-Debug "Set window $process.MainWindowHandle to TOPMOST state"
    $app::MakeTopMost($process.MainWindowHandle)
  }
		
}


# $openApplications = getOpenApplications
# $chosenApplication = createDropdownBox($openApplications)
# forceApplicationOnTop($chosenApplication)
# $title = Get-WindowByTitle *power* | Select-Object -First 1 | Select-Object MainWindowHandle, MainWindowTitle #| Out-String
# $x = $title | Select-Object -ExpandProperty MainWindowHandle
# $y = $title | Select-Object -ExpandProperty MainWindowTitle
# Write-Host $x
#Set-AlwaysOnTop #-MainWindowHandle $x -MainWindowTitle $y -Disable
