# Sourcing Playbook — 寻访渠道详解

四大渠道的完整打法。渠道 A/B 是主力，C/D 是增量。每轮寻访记录已扫池子，避免重复劳动。

---

## 渠道 A：GitHub 仓库贡献者扫描

### 原理

研究方向的社区集中在少数核心开源仓库。头部贡献者 ≈ 该方向最活跃的博士和工程师。一个仓库的贡献者列表往往是一个实验室/团队的群像——扫出一个核心仓库，等于端掉一个师门。

### 执行

```bash
# 用 scripts/scan_contributors.sh 批量扫
bash scripts/scan_contributors.sh volcengine/verl OpenRLHF/OpenRLHF huggingface/trl
# 再用 scripts/fetch_profiles.sh 批量拉 profile（name/company/location/bio/blog/email/twitter）
bash scripts/fetch_profiles.sh user1 user2 user3 > /tmp/candidates.tsv
```

### 筛选 profile 时看什么

- `bio`：学校、实验室、方向关键词、求职声明
- `blog`：个人主页链接（下一步挖邮箱和毕业时间的主入口）
- `company`/`location`：是否在读（`@connect.xxx.edu` 邮箱后缀是在读标志）、地理
- pinned 仓库：是否有一作的框架/benchmark——比 star 数更能说明水平
- followers：500+ 通常意味着社区影响力，但也意味着被多家猎头盯过

### 仓库清单（LLM post-training / agentic RL 方向，2026 年实测）

按价值排序，标注已扫轮次后逐步扩充：

| 仓库 | 说明 |
|---|---|
| volcengine/verl | RL post-training 框架，社区最大 |
| OpenRLHF/OpenRLHF | RLHF 框架 |
| huggingface/trl | RLHF/DPO 标准库 |
| THUDM/slime、inclusionAI/AReaL | Agent RL 框架 |
| NovaSky-AI/SkyRL、NVIDIA-NeMo/RL、radixark/miles | 新一代 RL infra |
| mll-lab-nu/RAGEN | agentic RL 专门框架（一个仓库带出一个学校的博士群） |
| PrimeIntellect-ai/prime-rl | 去中心化 RL |
| RLHFlow/RLHF-Reward-Modeling | reward modeling 核心 |
| huggingface/open-r1、SWE-bench/SWE-bench、OpenBMB/ToolBench、huggingface/lighteval | 评测/benchmark 池 |

**换方向时重建清单**：同领域搜 `gh search repos "{direction} framework"`，按 star 排序取前 10，排除纯教程/论文列表类仓库。

### 边际收益警告

同一批仓库扫 2 轮后新人产出趋近于零。发现重复率高就换渠道 B/C，别恋战。

---

## 渠道 B：求职声明检索（转化率最高）

### 原理

找工作的博士会在个人主页/GitHub bio 写 "on the job market" / "seeking full-time roles"。这类页面被 Google 高权重索引。一条搜索式同时完成三个筛选：**主动求职、方向自述、联系方式公开**。

### 查询式库（Google 直接粘贴）

```
"on the job market" PhD 2026 "post-training" OR "RLVR" OR "agentic RL" site:github.io
"seeking full-time roles" "post-training" OR "RL" PhD site:github.io
"expected graduation" 2026 OR 2027 "RLVR" OR "agentic RL" "seeking" PhD student post-training
"on the job market" "self-improving" OR "agentic reinforcement learning" PhD site:github.io OR site:edu
"looking for" "research scientist" "post-training" OR "RLHF" PhD 2026
```

变体技巧：

- 换年份：`2026` → `2027`（提前布局下一年）
- 换站点：`site:github.io` → 不限站点（命中 GitHub profile 本身）→ `site:edu`
- 换信号词：`job market` / `seeking` / `looking for opportunities` / `open to`
- 加方向新词：跟随当年热点（如 mid-training、process reward、world model）

### 注意

Google 结果摘要往往不含邮箱，必须点进主页抓 README 全文。个人主页的信息密度远高于 GitHub profile 页：毕业时间、导师、论文、实习、求职声明一次拿全。

---

## 渠道 C：论文与学术路线

### 论文作者挖掘

1. Google Scholar / arXiv 搜近两年方向关键词，限定顶会（ICLR/NeurIPS/ICML/ACL/EMNLP）
2. 取一作和通讯学生作者，查其个人主页
3. Semantic Scholar API 可从种子论文（如领域经典框架论文）批量拉引用者，筛当年新论文一作——比手工翻 Scholar 结构化

### 学校 job market 页面

每年秋招季，顶校会把求职博士生集中展示（如 Berkeley BAIR 年度 cohort 页面）。搜 `{school} PhD job market {year}` / `{lab} graduating class {year}`。一次命中一整页候选人，且求职意向明确。

### 导师组反查

列出领域 15-20 个核心导师，逐个扒 group members 页面。一个导师组 5-10 个博士，天然带方向和地理标签，还能顺便确认毕业时间。导师名单从渠道 A 扫出的强候选人的主页上提取（advisor 字段），滚动扩充。

---

## 渠道 D：人脉枢纽

领域里超窗的资深人选（团队 Lead、实习带教、知名研究员）不当候选人，当节点：

- 他们的论文合作者列表 = 团队成员名单，其中年轻作者才是符合时间窗的候选人
- 他们的职业流动轨迹（如前东家 → 现东家）揭示人才流向，整条链上的人都可挖
- 客户创始人的人脉网络是最该先用的资源：让创始人直接确认与枢纽人物的关系，认识则走内推，比冷启动高效一个量级

---

## 寻访名单维护

每轮结束更新名单文件（格式见 email-playbook.md），必须记录：

- 已扫的仓库/查询式（防重复）
- 分级（A 立即触达 / B 方向准但超窗 / C 备选 / 已排除含原因）
- 每人的邮箱来源和核实状态
- 已发送邮件日志
