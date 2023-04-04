# set utf-8 encoding
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# starship
Invoke-Expression (&starship init powershell)

# z.lua
Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell once enhanced fzf) -join "`n" })

# Alias
Set-Alias winfetch pwshfetch-test-1
