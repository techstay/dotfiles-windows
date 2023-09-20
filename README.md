# dotfiles-windows

![last commit](https://img.shields.io/github/last-commit/techstay/dotfiles-windows?style=flat-square)
![os](https://img.shields.io/badge/Windows_11-0078D6?style=flat-square&logo=windows-11&logoColor=white)

使用 Git 管理 Windows 系统下的配置文件。

## 开始使用

下列命令都在 powershell 中运行。

### 准备工作

- [安装 scoop](https://studynotes.techstay.tech/notes/windows/scoop.html)
- 安装[这篇笔记里提到的软件和字体](https://studynotes.techstay.tech/notes/windows/WindowsTerminalExperience.html)

### 克隆项目

创建 git 文件夹

```sh
mkdir $HOME/.dotfiles
```

克隆项目，如果你想建立自己的 dotfiles 项目，可以先 fork，然后将地址改为自己的。

```sh
git clone --bare https://github.com/techstay/dotfiles-windows $HOME/.dotfiles
```

如果克隆不成功，可能需要配置 git 代理。

```sh
git config --global http.proxy localhost:7890
```

检出 dotfiles，如果是新装的系统，可以添加`-f`参数强制检出，会覆盖本地的所有更改。

```sh
git --work-tree=$HOME --git-dir=$HOME/.dotfiles checkout
```

### 管理文件

现在已经拥有了一个正在使用 git 管理的主目录。对于要管理的配置文件，按照一般 git 项目的做法将文件提交到 dotfiles 中即可。

```sh
# 隐藏未跟踪文件
dot config --local status.showUntrackedFiles no
# 添加文件到暂存区
dot add somefile
# 查看状态
dot status
# 提交文件
dot commit -m 'commit message'
# 查看日志
dot log
# 推送到远程仓库
dot push
```

如果一些配置只在本地修改，不需要同步，可以现在本地创建并切换到分支，修改并提交配置文件。其余的配置文件继续通过主分支进行更新，而本地分支可以通过不断的变基到主分支上，来保持其他配置文件的最新状态。

你可以直接 fork 本仓库，然后将所有用户信息修改为自己的，这样就拥有了一个自己的 dotfiles。如果愿意的话，也可以从我的仓库继续同步更新。

## 配置文件

这里列出了一些配置文件的说明。

### SSH

几个远程 SSH 的配置。

### python

使用[清华镜像](https://mirrors.tuna.tsinghua.edu.cn/help/pypi/)。

```sh
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

### npm

使用[淘宝镜像](https://npmmirror.com)。

```sh
# 查看当前npm镜像
npm config get registry

# 设置npm镜像
https://registry.npmmirror.com/
```

文档 <https://docs.npmjs.com/cli/v8/commands/npm-config>

### cmd & powershell

安装了 clink 和 powershell，均使用了 starship 的主题。终端的具体配置参考[我的笔记](https://github.com/techstay/studyNotes)。

### starship

使用 Pastel Powerline 主题，可通过下列命令更新。

```powershell
Invoke-WebRequest https://starship.rs/presets/toml/pastel-powerline.toml -OutFile $HOME/.config/starship.toml
```

其他预配置主题<https://starship.rs/presets/> 或者到 github 社区寻找。

### git

我的 git 配置。
