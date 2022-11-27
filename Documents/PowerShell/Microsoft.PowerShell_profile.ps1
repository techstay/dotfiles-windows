Import-Module posh-git
Import-Module -Name Terminal-Icons

Invoke-Expression (&starship init powershell)

# z.lua
Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell once enhanced fzf) -join "`n" })

# gh cli
Invoke-Expression -Command $(gh completion -s powershell | Out-String)

# Functions
function Dotfiles {
    git --git-dir="$HOME/.dotfiles/" --work-tree=$HOME $args
}

# Alias
Set-Alias winfetch pwshfetch-test-1
Set-Alias dot Dotfiles

