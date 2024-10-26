$modules = "git",
    "odin",
    "magic"

$modules | ForEach-Object {
    . "$PSScriptRoot/$_.ps1"
}
