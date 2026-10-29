# 🚀 DiffChecker Pro 本地安装与跨电脑部署指南

`DiffChecker Pro` 是一款无广告、纯净高效的代码、图像、PDF、目录与表格对比工具，内置深度 Codex / Claude / DeepSeek AI 全流程步骤拆解与架构审计能力。

本文档指导如何在 **macOS** 和 **Windows** 电脑上快速安装并运行本工具。

---

## 目录
- [💻 macOS 用户安装指南](#-macos-用户安装指南)
  - [方式一：使用 DMG 安装包（推荐）](#方式一使用-dmg-安装包推荐)
  - [方式二：一键脚本自动化安装](#方式二一键脚本自动化安装)
  - [方式三：解压运行](#方式三解压运行)
- [🪟 Windows 用户安装指南](#-windows-用户安装指南)
  - [方式一：一键快捷安装（推荐）](#方式一一键快捷安装推荐)
  - [方式二：解压直接双击运行](#方式二解压直接双击运行)
- [🌐 离线环境与源码运行](#-离线环境与源码运行)
- [❓ 常见问题排查与解决](#-常见问题排查与解决)

---

## 💻 macOS 用户安装指南

### 方式一：使用 DMG 安装包（推荐）
1. 从 GitHub 仓库的 [Releases](https://github.com/rabby-weex/diffchecker-pro/releases) 页面下载 `DiffCheckerPro-macOS-v1.0.0.dmg`；
2. 双击打开 `DiffCheckerPro-macOS-v1.0.0.dmg`；
3. 将 **`DiffChecker Pro.app`** 拖拽到右侧的 **`Applications`（应用程序）** 文件夹；
4. 在「访达 -> 应用程序」或「聚焦搜索 (Spotlight)」中搜索 `DiffChecker Pro` 即可秒级启动！

> **首次打开安全提示说明**：
> 如果 macOS 提示“无法打开，因为来自身份不明的开发者”，请在应用图标上**单击右键 -> 选「打开」-> 再点击「打开」**即可信任运行；或在终端中执行：
> ```bash
> xattr -cr "/Applications/DiffChecker Pro.app"
> ```

---

### 方式二：一键脚本自动化安装
克隆或下载源码后，在项目根目录运行安装脚本：
```bash
chmod +x install.sh
./install.sh
```
脚本会自动将 `DiffChecker Pro.app` 安装到 `/Applications/`，移除隔离属性并在桌面创建快捷方式。

---

### 方式三：解压运行
1. 下载 `DiffCheckerPro-macOS-v1.0.0.zip` 并解压；
2. 直接双击解压出的 `DiffChecker Pro.app` 即可独立运行。

---

## 🪟 Windows 用户安装指南

### 方式一：一键快捷安装（推荐）
1. 从 GitHub 仓库的 [Releases](https://github.com/rabby-weex/diffchecker-pro/releases) 页面下载 `DiffCheckerPro-Windows-v1.0.0.zip`；
2. 右键解压到任意文件夹（例如 `D:\DiffCheckerPro` 或 `C:\Tools\DiffCheckerPro`）；
3. 进入文件夹，鼠标右键以管理员或直接双击运行 **`install.bat`**；
4. 脚本将自动在你的 Windows 桌面上创建 **`DiffChecker Pro`** 快捷方式；
5. 之后双击桌面上的快捷方式即可像原生电脑软件一样启动！

---

### 方式二：解压直接双击运行
如果不希望创建桌面图标：
* 直接双击文件夹中的 **`DiffCheckerPro.vbs`**（**推荐**：静默后台启动，没有烦人的黑框控制台）；
* 或者双击 **`DiffCheckerPro.bat`** 启动。

> **Windows 运行依赖**：
> 本工具需要电脑安装有 Python 3.7+（仅使用标准库，无需安装任何第三方 pip 模块）。
> 若未安装，请前往 [Python 官网](https://www.python.org/downloads/) 下载安装，并在安装界面务必勾选 **`Add Python to PATH`**。

---

## 🌐 离线环境与源码运行

本项目零重度外部依赖，直接支持任意平台的源码运行：

1. 克隆代码：
   ```bash
   git clone https://github.com/rabby-weex/diffchecker-pro.git
   cd diffchecker-pro
   ```
2. 启动本地服务：
   ```bash
   python3 server.py
   ```
3. 在任意浏览器打开：
   ```
   http://127.0.0.1:28833/
   ```

---

## ❓ 常见问题排查与解决

#### 1. 提示端口被占用？
工具默认使用本地 `28833` 端口。如果被占用，可手动终止旧进程：
* macOS / Linux: `pkill -f "python3.*server.py"`
* Windows: `taskkill /f /im python.exe`

#### 2. 点击「🤖 AI 分析」提示网络失败？
* 本工具预设接入 WEEX AI Gateway (`https://ai-gateway.weex.tech/v1`)；
* 请确保电脑处于可访问网关的办公网络或 VPN 状态；
* 点击右上角「⚙️ 接入信息」可随时修改自定义 API Key 或 Base URL。
