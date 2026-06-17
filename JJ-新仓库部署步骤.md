# TrendRadar-v2 新仓库部署步骤

## 1. 在 GitHub 新建仓库

打开：

```text
https://github.com/new
```

建议填写：

```text
Repository name: TrendRadar-v2
Visibility: Public 或 Private 都可以
```

注意：

- 不要勾选 `Add a README file`
- 不要添加 `.gitignore`
- 不要选择 License

因为本地项目已经准备好了这些文件。

## 2. 推送本地代码

在 PowerShell 里运行：

```powershell
cd "F:\AI学习\JJ的仓库\JJ的仓库\TrendRadar-v2"
git remote add origin https://github.com/Jeygen-JJ/TrendRadar-v2.git
git push -u origin main
```

如果你用了其他仓库名，把 URL 里的 `TrendRadar-v2` 换成你的新仓库名。

## 3. 添加 Actions Secrets

进入新仓库：

```text
Settings -> Secrets and variables -> Actions -> New repository secret
```

如果只想先测试 workflow 能不能跑，可以暂时不加任何 secret。

如果要启用通知或 AI 分析，再按需添加：

```text
FEISHU_WEBHOOK_URL
TELEGRAM_BOT_TOKEN
TELEGRAM_CHAT_ID
AI_ANALYSIS_ENABLED
AI_API_KEY
AI_MODEL
AI_API_BASE
```

## 4. 第一次测试

进入：

```text
Actions -> Get Hot News -> Run workflow
```

新 workflow 已经加了并发控制：

```yaml
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true
```

以后同一个分支同一个 workflow 不会无限堆积。

## 5. 旧仓库处理

旧仓库 `TrendRadar` 可以先不要删除，建议先改名或 Archive：

```text
Settings -> General -> Archive repository
```

等 `TrendRadar-v2` 稳定运行几天后，再决定是否删除旧仓库。

