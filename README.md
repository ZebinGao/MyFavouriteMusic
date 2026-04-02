# 🎵 MyFavouriteMusic

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

个人喜欢的音乐收藏，收录了约 110 首中外歌曲，涵盖中文、德语、英语、日语、法语、拉丁语等多种语言。

## 📂 项目结构

```
MyFavouriteMusic/
├── 音乐/                        # 音乐文件目录
├── AutoStart.ahk                # AutoHotkey v2 脚本（CapsLock 增强 + 音乐播放）
├── rename_music_files.py        # Python 脚本（批量去除文件名中的空格）
├── AutoHotkey_2.0.18_setup.exe  # AutoHotkey v2 安装包
├── LICENSE                      # MIT 许可证
└── README.md
```

## 🎶 音乐收藏

音乐文件存放在 `音乐/` 目录下，命名格式为 `艺术家-歌曲名.mp3`（已去除空格）。

### 收录语言

| 语言 | 代表艺术家 / 歌曲 |
|------|------------------|
| 🇨🇳 中文 | 张学友、张韶涵、赵雷、朴树、许巍、萨顶顶、周深…… |
| 🇩🇪 德语 | Eisblume、Mark Forster、Cro、Unheilig、Philipp Poisel…… |
| 🇬🇧 英语 | Lady Gaga、Ed Sheeran、Orla Fallon…… |
| 🇯🇵 日语 | 久石譲、坂本龍一、中島美嘉、VISUALARTS／Key…… |
| 🇫🇷 法语 | Yikoko（大鱼法语版） |
| 🇪🇸 拉丁语 | Luis Fonsi - Despacito |
| 🇷🇺 俄语 | Kuljugin E.V. |

### 部分精选曲目

<details>
<summary>📖 点击展开曲目列表</summary>

| # | 歌曲 | 艺术家 |
|---|------|--------|
| 1 | 喜欢你 | Beyond |
| 2 | 小夜曲 | Franz Schubert |
| 3 | 你不是真正的快乐 | G.E.M. 邓紫棋 |
| 4 | Five Hundred Miles | Orla Fallon |
| 5 | 梦中的婚礼 | Richard Clayderman |
| 6 | 僕が死のうと思ったのは | 中島美嘉 |
| 7 | 幽灵公主 | 久石譲 |
| 8 | 起风了 | 买辣椒也用券 |
| 9 | 平凡之路 | 朴树 |
| 10 | 悟空 | 戴荃 |
| 11 | 夜空中最亮的星 | 逃跑计划 |
| 12 | 理想三旬 | 陈鸿宇 |
| 13 | 万物生 | 萨顶顶 |
| 14 | 隐形的翅膀 | 张韶涵 |
| 15 | 蓝莲花 | 许巍 |
| 16 | 潮鳴り | VISUALARTS／Key |
| 17 | Amore / Rain / Solitude | 坂本龍一 |
| 18 | Despacito (Remix) | Luis Fonsi, Daddy Yankee, Justin Bieber |
| 19 | Schnappi | 鳄鱼宝贝 |
| 20 | 江苏省泰州中学校歌 | 江苏省泰州中学合唱团 |

> 完整曲目请查看 `音乐/` 目录。

</details>

## 🛠️ 工具说明

### AutoStart.ahk — CapsLock 增强 & 音乐播放

基于 [AutoHotkey v2](https://www.autohotkey.com/) 的增强脚本，主要功能：

#### CapsLock 增强（Hyper Key）

| 快捷键 | 功能 |
|--------|------|
| `CapsLock`（单击） | 发送 `Esc` |
| `Shift + CapsLock` | 切换大写锁定 |
| `CapsLock + T` | 打开终端 |
| `CapsLock + G` | 打开 Gemini |
| `CapsLock + B` | 打开百度 |
| `CapsLock + S` | 打开截屏工具 |
| `CapsLock + O` | 打开 GitHub 文件夹 |
| `CapsLock + W` | 启动 WinAppDriver |
| `CapsLock + K` | 关闭 WinAppDriver |
| `CapsLock + A` | 批量关闭模拟器进程 |

#### 🎵 音乐播放快捷键

脚本启动时会创建一个后台 Windows Media Player COM 对象，音量初始为 20%。

| 快捷键 | 功能 |
|--------|------|
| `CapsLock + P` | 随机播放 `音乐/` 目录中的一首歌 |
| `CapsLock + L` | 停止播放 |
| `CapsLock + Space` | 暂停 / 继续 |

#### 使用方法

1. 安装 AutoHotkey v2（可使用项目中的 `AutoHotkey_2.0.18_setup.exe`）
2. 双击运行 `AutoStart.ahk`（或将其放入开机启动文件夹）

---

### rename_music_files.py — 批量去除文件名空格

将 `音乐/` 目录下所有音频文件名中的空格去除。

```bash
python rename_music_files.py
```

支持格式：`.mp3`、`.m4a`、`.wav`、`.flac`、`.ogg`

# 常用快捷键

- **Win + L**：锁定电脑 (Lock)。注意：这是系统底层安全指令，AHK 很难屏蔽它，也不建议屏蔽。
- Win + R：运行 (Run)。开发者最爱，输入 cmd、notepad 等。
- **Win + E**：打开资源管理器 (Explorer)。
- **Win + D**：显示桌面 (Desktop)。再次按下恢复窗口。
- **Win + V**：打开剪贴板历史 (Clipboard)。强烈推荐开启，开发时复制粘贴多段代码的神器。
- Win + X：打开简易开始菜单 (Power User Menu)。就是右键点击开始按钮的那个菜单，包含终端管理员、设备管理器等。
- Win + I：打开设置 (Settings)。
- Win + S / Win + Q：打开搜索 (Search)。
- Win + P：投影设置 (Project)。切换多显示器模式（扩展、复制）时必用。
- **Win + A**：快速设置 (Action Center)。(Wi-Fi、蓝牙开关)。
- **Win + G**：Xbox 游戏栏 (Game Bar)。(录屏)。
- Win + H：语音输入/听写 (Hearing/Dictation)。
- Win + K：投屏/连接 (Connect)。(连接无线显示器或蓝牙设备)。
- **Win + M**：最小化所有窗口 (Minimize)。和 Win+D 类似，但 Win+D 是“显示桌面”，Win+M 是单纯最小化，**Win+Shift+M** 还原。
- Win + N：打开通知中心 (Notification)。(Win 11 专用)。
- Win + W：打开小组件 (Widgets)。(天气、新闻)。
- Win + Z：窗口布局 (Snap Layouts)。Win 11 那个把窗口吸附到角落的菜单。
- Win + C：Copilot (AI 助手) / Teams 聊天 / Cortana。取决于你的系统版本。
- **Win + T**：在任务栏图标之间循环切换。
- **Win + ← / →**	分屏：将窗口吸附到屏幕左/右半边	左边写代码，右边看文档/浏览器。
- Win + ↑ / ↓	最大化/最小化：配合左右键，可以把窗口缩成 1/4 大小	四宫格布局：终端、编辑器、浏览器、微信各占一角。
- Win + Shift + ← / →	跨屏移动：将当前窗口瞬间“踢”到另一个显示器	多显示器神器。不用鼠标拖拽，瞬间把 VS Code 扔到副屏。


## 资源管理器

- F2: 重命名 (Rename)。
- Alt + Enter: 查看属性 (不用右键->属性)。
- Alt + ↑: 返回上一级文件夹。
- Alt + P: 开启/关闭预览窗格 (不用打开文件就能看图片或代码片段)。

## 文本编辑与光标移动(写代码/脚本必备)

### windows通用标准

- Ctrl + Delete	向后删除一个单词
- Ctrl + Backspace 是删前面的词
- Ctrl + Shift + ← / →	按单词选中

### vs code 专用
- Alt + ↑ / ↓	整行移动
- Shift + Alt + ↑ / ↓	整行复制
- Ctrl + D	选中下一个匹配项 (多光标)
- Ctrl + /	注释/取消注释
- Ctrl + G	跳转到行	报错说“Error at line 85”，按 Ctrl+G 输入 85 回车，直接飞过去。
- Ctrl + Enter	在下方插入新行	不管你光标在当前行的中间还是末尾，按这个直接在下面开一行，不需要先按 End 再按 Enter。


## ⚠️ 注意事项

- 本仓库中的音乐文件仅供个人学习与收藏使用，请勿用于商业用途。
- 如涉及版权问题，请联系仓库所有者处理。

## 📄 许可证

本项目代码部分采用 [MIT License](LICENSE) 开源许可。音乐文件版权归原作者所有。