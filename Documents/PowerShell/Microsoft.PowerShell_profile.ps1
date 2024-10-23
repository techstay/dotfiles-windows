# ------------------------------------------------------------------------------
# Import Modules
# ------------------------------------------------------------------------------
# scoop intall posh-git scoop-completion terminal-icons
# Import-Module posh-git
# Import-Module -Name Terminal-Icons
# Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"

# ------------------------------------------------------------------------------
# Completions
# ------------------------------------------------------------------------------
# gh completion -s powershell | Out-String | Invoke-Expression
hugo completion powershell | Out-String | Invoke-Expression
# genact --print-completions powershell | Out-String | Invoke-Expression

# ------------------------------------------------------------------------------
# Terminal Configuration
# ------------------------------------------------------------------------------

# Invoke-Expression (&starship init powershell)
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/1_shell.omp.json" | Invoke-Expression

# Set up utf-8 encoding
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin

# Set up z.lua
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

function scoop-clean {
    scoop cleanup *
    scoop cache rm *
}
#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
