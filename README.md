# dotfiles-windows

![last commit](https://img.shields.io/github/last-commit/techstay/dotfiles-windows?style=for-the-badge)
![os](https://img.shields.io/badge/Windows_11-0078D6?style=for-the-badge&logo=windows-11&logoColor=white)

使用 chezmoi 管理 Windows 系统下的配置文件。

> [!TIP]
> 我一开始直接使用 git 附带`--work-tree`和`--git-dir`参数的方式来管理 dotfiles，这样虽然也可以工作，但是有一个问题就是非常不方便和图形化 git 客户端协作。同时修改了多个文件的话只能通过命令行的方式查看差异，非常不方便。所以现在切换到了 chezmoi，它有自己的独立目录，图形化 git 界面可以工作，同时有自己的文件同步方式，使用起来也不错。

## 开始使用

### 准备工作

```sh
scoop install chezmoi
```

### 克隆项目

```sh
chezmoi init https://github.com/techstay/dotfiles-windows.git
```

克隆完成后使用`chezmoi apply`应用配置文件。或者在初始化的时候就添加`--apply`参数直接应用。

### 管理文件

chezmoi 会在自己独立的目录中管理所有 dotfiles，可以通过`cd`命令打开。在这个目录下可以像管理普通 git 项目那样进行操作。

```sh
chezmoi cd
```

要添加文件，使用`add`命令。

```sh
chezmoi add xx.file
```

要编辑文件，使用`edit`命令。

```sh
chezmoi edit --apply xxx
```

用 chezmoi 覆盖文件，用`apply`命令。

```sh
chezmoi apply
```

## 配置文件

配置文件比较多，就不一一说明了，这里只列举一些需要额外说明的。其他不懂得配置，直接在 AI 里面问就可以了。

### powershell 主题

使用 oh-my-posh 主题，可通过下列命令安装。

```powershell
winget install JanDeDobbeleer.OhMyPosh --source winget
```

其他主题可以在[主题预览](https://ohmyposh.dev/docs/themes)中看到。

cmd 主题需要通过[clink](https://ohmyposh.dev/docs/installation/prompt?shell=cmd)修改。

### rime

我的 rime 输入法配置，基于薄荷输入法。

更新基础配置和词库，需要在 git bash 中运行。

```sh
curl -fsSL https://raw.githubusercontent.com/rime/plum/master/rime-install | bash -s -- Mintimate/oh-my-rime:plum/full
```
