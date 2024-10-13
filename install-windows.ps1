Write-Host "Trying to get Admin rights to also install fonts"

# Get the ID and security principal of the current user account
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

# Get the security principal for the Administrator role
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

if ($myWindowsPrincipal.IsInRole($adminRole)) {
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
    clear-host
}
else {
    Start-Process "pwsh" -Verb runas "-File $PSScriptRoot\install-windows.ps1" 
    
    # Exit from the current, unelevated, process
    exit
}

Write-Host "Installing dotfiles"

# installing powershell config
Write-Host "Installing powershell config"
Remove-Item ~/Documents/PowerShell
New-Item -ItemType SymbolicLink -Path ~/Documents/PowerShell -Value $PSScriptRoot/dot-config/powershell

# installing helix config
Write-Host "Installing helix config"
Remove-Item $env:APPDATA/helix
New-Item -ItemType SymbolicLink -Path $env:APPDATA/helix -Value $PSScriptRoot/dot-config/helix

# installing gitconfig
Write-Host "Installing gitconfig"
Remove-Item ~/.gitconfig
New-Item -ItemType SymbolicLink -Path ~/.gitconfig -Value $PSScriptRoot/dot-gitconfig


# installing fonts
# source: https://gist.github.com/anthonyeden/0088b07de8951403a643a8485af2709b
Write-Host "Installing fonts"

$fontList = Get-ChildItem -Recurse -Path "$PSScriptRoot/dot-fonts/" -Include ("*.ttf")
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)

foreach($font in $fontList) {
    if (-not (Test-Path -Path "C:\Windows\Fonts\$($font.Name)")) {
        Write-Host "Installing font -" $font.BaseName
        Copy-Item $font "C:\Windows\Fonts"

        # register font for all users
        New-ItemProperty -Name $font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $font.name
    }
    else {
        Write-Host "Already Installed font -" $font.BaseName
    }
}

 # Run your code that needs to be elevated here
 Write-Host -NoNewLine "Press any key to continue..."
 $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
