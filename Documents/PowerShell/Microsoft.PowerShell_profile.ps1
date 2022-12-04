Import-Module posh-git
Import-Module -Name Terminal-Icons

Invoke-Expression (&starship init powershell)

# set utf-8 encoding
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineKeyHandler -Key Tab -Function Complete # 设置 Tab 键补全
Set-PSReadLineKeyHandler -Chord 'Ctrl+RightArrow' -Function ForwardWord # 设置 ctrl + 向右键逐字补全
Set-PSReadLineKeyHandler -Key 'Ctrl+z' -Function Undo # 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward # 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward # 设置向下键为前向搜索历史纪录

# z.lua
Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell enhanced) -join "`n" })

gh completion -s powershell | Out-String | Invoke-Expression
hugo completion powershell | Out-String | Invoke-Expression

# Functions
function Dotfiles {
    git --git-dir="$HOME/.dotfiles/" --work-tree=$HOME $args
}

# Alias
Set-Alias winfetch pwshfetch-test-1
Set-Alias dot Dotfiles

