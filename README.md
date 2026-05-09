# 可交互网页项目

## 项目结构

```
d:\website\
├── index.html          # 主页 - 可交互网页示例
├── test.html           # 逻辑思维训练游戏
├── data/               # 素材文件夹（用于存放图片等资源）
├── server.js           # Node.js 服务器（需要Node.js）
├── start_server.bat    # Windows 批处理启动脚本
└── start_server.ps1    # PowerShell 服务器脚本
```

## 如何使用

### 方法一：直接在浏览器中打开（推荐）
1. 双击 `index.html` 或 `test.html` 文件
2. 文件将在默认浏览器中打开
3. 无需安装任何额外软件

### 方法二：使用批处理脚本启动服务器
1. 双击 `start_server.bat` 文件
2. 服务器将在 `http://localhost:8080` 上运行
3. 在浏览器中访问：
   - 主页：http://localhost:8080/index.html
   - 逻辑思维训练：http://localhost:8080/test.html

### 方法三：使用 PowerShell 服务器
1. 右键点击 `start_server.ps1`
2. 选择"使用 PowerShell 运行"
3. 在浏览器中访问 `http://localhost:8080`

### 方法四：使用 Node.js 服务器（需要安装 Node.js）
1. 打开命令提示符
2. 运行：`node server.js`
3. 在浏览器中访问 `http://localhost:8080`

## 功能介绍

### index.html - 可交互网页示例
- 计数器功能
- 文本处理功能
- 图片画廊（支持点击查看大图）

### test.html - 逻辑思维训练游戏
包含4种游戏模式：
1. **记忆模式** - 记住亮起的方块位置，然后点击
2. **顺序模式** - 按从小到大的顺序点击方块
3. **找规律模式** - 找出方块中的规律并点击正确答案
4. **数学模式** - 计算方块上的数学题，点击正确答案

游戏特色：
- 实时分数统计
- 连续正确记录
- 最高分记录
- 美观的界面设计
- 响应式布局

## data 文件夹
用于存放图片、音频等素材文件。您可以在 `test.html` 中引用这些素材。

## 技术栈
- HTML5
- CSS3
- JavaScript (ES6+)

## 系统要求
- 现代浏览器（Chrome、Firefox、Edge、Safari）
- Windows 操作系统

## 注意事项
- 如果使用服务器，确保端口 8080 没有被占用
- 建议使用方法一（直接打开）获得最佳体验