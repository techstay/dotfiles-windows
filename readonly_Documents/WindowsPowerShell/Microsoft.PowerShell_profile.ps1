# set utf-8 encoding
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

oh-my-posh init pwsh --config cert | Invoke-Expression

# z.lua
Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell once enhanced fzf) -join "`n" })
