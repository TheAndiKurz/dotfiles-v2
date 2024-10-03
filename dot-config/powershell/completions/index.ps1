$modules = "git",
    "odin"

$modules | ForEach-Object {
    . "$PSScriptRoot/$_.ps1"
}
