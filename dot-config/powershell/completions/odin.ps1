$s = {
param($wordToComplete, $commandAst, $cursorPosition)

    $argc = $commandAst.CommandElements.Count
    $available = @{
        build = @(
            "out:"            
            "o:"
        );
        run = @(
            
        );
    }

    if ($argc -le 1) {
        return $available.Keys
    }

    $subcommand = $commandAst.CommandElements[1]
    $subcommand | Out-File -FilePath "~/pwsh.log"

    if (-not ($available.ContainsKey("$subcommand"))) {
        return $available.Keys | Where-Object { $_ -like "$wordToComplete*" }
    }

    if ($wordToComplete -like "-*") {
        $available["$subcommand"] | Out-File -FilePath "~/pwsh.log" -Append
        $available["$subcommand"] 
            | ForEach-Object { "-$_" }
            | Where-Object { "$_" -like "$wordToComplete*" }
    }
}

Register-ArgumentCompleter -Native -CommandName odin -ScriptBlock $s
