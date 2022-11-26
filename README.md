# dotfiles-windows

使用 Git 管理 Windows 系统下的配置文件。

## 开始使用

下列命令都在 powershell 中运行。

创建 git 文件夹。

```sh
mkdir $HOME/.dotfiles
```

克隆项目。

```sh
git clone --bare <url> $HOME/.dotfiles
```

添加`.gitignore`文件。

```sh
echo .dotfiles > $HOME/.gitignore
```

配置 powershell alias(使用`code $PROFILE`打开 powershell 配置文件并添加以下内容)。

```powershell
function Dotfiles {
    git --git-dir="$HOME/.dotfiles/" --work-tree=$HOME $args
}
Set-Alias dot Dotfiles
```

不显示跟踪文件。

```sh
dot config --local status.showUntrackedFiles no
```

一切准备就绪之后，检出项目。如果因为文件冲突而检出失败，请手动备份并移除文件，然后再次检出。

```sh
dot checkout

# 检查文件状态
dot status

# 如果确认不需要保留本地更改，可以添加-f参数，会强制覆盖本地文件
dot checkout -f
```
