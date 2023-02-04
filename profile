Import-Module posh-git
Import-Module Terminal-Icons

$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'

function utiliserDocker {
    wsl -d ubuntu-docker docker $args
}

Set-Alias docker utiliserDocker

function lancerContainer {
    wsl -d ubuntu-docker docker-compose -p da157-ti -f $args up --build -d
}

Set-Alias lcda157 lancerContainer

function linuxPath {
    wsl wslpath -a .
}

Set-Alias lpath linuxPath

$tmp = [System.IO.Path]::GetTempFileName()
if (Test-Path -PathType Leaf "$tmp") {
    $dir = Get-Content "$tmp"
    Remove-Item -Force "$tmp"
    if ($dir -And (Test-Path -PathType Container "$dir")) {
        if ("$dir" -ne "$pwd") {
            cd "$dir"
        }
    }
}
Set-PSReadLineKeyHandler -Chord Ctrl+l -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('lfcd.ps1')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineKeyHandler -Chord "Ctrl+m" -Function AcceptSuggestion
