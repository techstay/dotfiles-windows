Import-Module posh-git
Import-Module -Name Terminal-Icons

Invoke-Expression (&starship init powershell)

# z.lua
Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell once enhanced) -join "`n" })

gh completion -s powershell | Out-String | Invoke-Expression
hugo completion powershell | Out-String | Invoke-Expression

# Functions
function Dotfiles {
    git --git-dir="$HOME/.dotfiles/" --work-tree=$HOME $args
}

# Alias
Set-Alias winfetch pwshfetch-test-1
Set-Alias dot Dotfiles

