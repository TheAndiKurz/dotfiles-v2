if (Get-Command magic -ErrorAction SilentlyContinue) { 
    (@(magic completion --shell powershell) -join "`n") | Invoke-Expression
}
