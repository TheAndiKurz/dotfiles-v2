$extra_paths = "~/.cargo/bin/",
     "~/.local/bin/",
     "~/.local/kitty.app/bin",
     "~/.dotnet/tools",
     "/opt/nvim-linux64/bin"

$env:PATH += $extra_paths | Join-String -Separator ":"
