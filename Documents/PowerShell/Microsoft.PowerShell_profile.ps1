Import-Module posh-git
Import-Module -Name Terminal-Icons

# Invoke-Expression (&starship init powershell)
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/unicorn.omp.json" | Invoke-Expression

# set utf-8 encoding
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin

# z.lua
Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell enhanced) -join "`n" })

function zb {
    z -b $args
}

gh completion -s powershell | Out-String | Invoke-Expression
hugo completion powershell | Out-String | Invoke-Expression

# Functions
function dot {
    git --git-dir="$HOME/.dotfiles/" --work-tree=$HOME $args
}

# Alias
Set-Alias winfetch pwshfetch-test-1
