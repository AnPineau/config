Import-Module posh-git
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