$env.PATH = ($env.PATH | split row (char esep))
$env.PATH | append "~/.cargo/bin"
$env.PATH | append "~/.bun/bin"
$env.PATH | append "~/.local/bin/"
$env.PATH | append "~/.dotnet/tools"

$env.PATH | append "/opt/nvim-linux64/bin"
$env.PATH | append "~/.local/kitty.app/bin"
$env.PATH | append "~/.modular/bin"

