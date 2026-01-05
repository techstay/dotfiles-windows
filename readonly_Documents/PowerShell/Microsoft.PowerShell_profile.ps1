# ------------------------------------------------------------------------------
# Import Modules
# ------------------------------------------------------------------------------
# scoop install posh-git scoop-completion terminal-icons
# Import-Module posh-git
Import-Module -Name Terminal-Icons
# Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"

# ------------------------------------------------------------------------------
# Completions
# ------------------------------------------------------------------------------
gh completion -s powershell | Out-String | Invoke-Expression
# hugo completion powershell | Out-String | Invoke-Expression
# genact --print-completions powershell | Out-String | Invoke-Expression

# ------------------------------------------------------------------------------
# Terminal Configuration
# ------------------------------------------------------------------------------

# Invoke-Expression (&starship init powershell)
oh-my-posh init pwsh --config cert | Invoke-Expression

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

function scoop-clean {
    scoop cleanup *
    scoop cache rm *
}

function set-proxy {
    git config --global http.proxy http://localhost:7890
    git config --global https.proxy http://localhost:7890
    scoop config proxy localhost:7890
}

function unset-proxy {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    scoop config proxy ''
}

function genshin-gacha {
    Invoke-Expression(Invoke-RestMethod 'https://img.lelaer.com/cn.ps1')
}

function zzz-gacha {
    Invoke-Expression (New-Object Net.WebClient).DownloadString('https://xingqiong-oss.oss-cn-hangzhou.aliyuncs.com/pc/down/zzz_gf.ps1')
}

function honkai-starrail {
    Invoke-Expression(Invoke-RestMethod 'https://xingqiong-oss.oss-cn-hangzhou.aliyuncs.com/pc/down/s_gf.ps1')
}
