# ------------------------------------------------------------------------------
# Import Modules
# ------------------------------------------------------------------------------
# Import-Module posh-git
# Import-Module -Name Terminal-Icons
# Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"

# ------------------------------------------------------------------------------
# Completions
# ------------------------------------------------------------------------------
# Get-ChildItem -Path $PROFILE/../Completions/ | ForEach-Object { . $_ }

# ------------------------------------------------------------------------------
# Terminal Configuration
# ------------------------------------------------------------------------------

Invoke-Expression (&starship init powershell)
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/montys.omp.json" | Invoke-Expression

# set utf-8 encoding
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin

# z.lua
Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell enhanced) -join "`n" })

function zb {
    z -b $args
}


# ------------------------------------------------------------------------------
# User Defined Functions and Alias
# ------------------------------------------------------------------------------

function dot {
    git --git-dir="$HOME/.dotfiles/" --work-tree=$HOME $args
}

Set-Alias winfetch pwshfetch-test-1
