Import-Module posh-git
Import-Module -Name Terminal-Icons

Invoke-Expression (&starship init powershell)

# set utf-8 encoding
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin

# z.lua
Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell enhanced) -join "`n" })

function zb {
    z -b $args
}

# Completions
Get-ChildItem -Path $PROFILE/../Completions/ | ForEach-Object { . $_ }

# Functions
function dot {
    git --git-dir="$HOME/.dotfiles/" --work-tree=$HOME $args
}

# Alias
Set-Alias winfetch pwshfetch-test-1
