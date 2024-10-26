$separator = ":"

if ($IsWindows) {
     $separator = ";"
}

$extra_paths = "~/.cargo/bin/",
     "~/.bun/bin",
     "~/.local/bin/",
     "~/.dotnet/tools"

$unix_paths = "/opt/nvim-linux64/bin",
     "~/.local/kitty.app/bin",
     "~/.modular/bin"

$windows_paths = ""

$env:PATH += $separator
$env:PATH += $extra_paths | Join-String -Separator $separator

if ($IsWindows) {
     $env:PATH += $separator
     $env:PATH += $windows_paths | Join-String -Separator $separator
}

if (-not $IsWindows) {
     $env:PATH += $separator
     $env:PATH += $unix_paths | Join-String -Separator $separator
}
