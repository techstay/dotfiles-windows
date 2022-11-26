# dotfiles-windows

![last commit](https://img.shields.io/github/last-commit/techstay/dotfiles-windows?style=flat-square)
![](https://img.shields.io/badge/Windows_11-0078D6?style=flat-square&logo=windows-11&logoColor=white)

使用 Git 管理 Windows 系统下的配置文件。

## 开始使用

下列命令都在 powershell 中运行。

创建 git 文件夹

```sh
mkdir $HOME/.dotfiles
```

克隆项目

```sh
git clone --bare <url> $HOME/.dotfiles
```

添加`.gitignore`文件

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

不显示跟踪文件

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

## 配置文件

这里列出了已经添加的配置文件以及说明。

### npm

使用[淘宝镜像](https://npmmirror.com)。

```sh
# 查看当前npm镜像
npm config get registry

# 设置npm镜像
https://registry.npmmirror.com/
```

文档 <https://docs.npmjs.com/cli/v8/commands/npm-config>

### starship

使用 Pastel Powerline 主题，可通过下列命令更新。

```powershell
Invoke-WebRequest https://starship.rs/presets/toml/pastel-powerline.toml -OutFile $HOME/.config/starship.toml
```

其他预配置主题<https://starship.rs/presets/> 或者到 github 社区寻找。
