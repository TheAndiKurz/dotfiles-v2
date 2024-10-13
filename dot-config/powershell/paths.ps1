$seperator = ":"

if ($IsWindows) {
     $seperator = ";"
}

$extra_paths = "~/.cargo/bin/",
     "~/.local/bin/",
     "~/.dotnet/tools"

$unix_paths = "/opt/nvim-linux64/bin",
     "~/.local/kitty.app/bin"

$windows_paths = ""

$env:PATH += $seperator
$env:PATH += $extra_paths | Join-String -Separator $seperator

if ($IsWindows) {
     $env:PATH += $seperator
     $env:PATH += $windows_paths | Join-String -Separator $seperator
}

if ($IsUnix) {
     $env:PATH += $seperator
     $env:PATH += $unix_paths | Join-String -Seperator $seperator
}
