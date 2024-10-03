. $PSScriptRoot/paths.ps1
. $PSScriptRoot/alias.ps1
. $PSScriptRoot/completions/index.ps1

oh-my-posh init pwsh --config "$PSScriptRoot/shell.toml" | Invoke-Expression 

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Invoke-Expression (& { zoxide init --cmd cd powershell | Out-String })

$PSStyle.FileInfo.Directory =  "`e[33;4m" # yellow underlined
