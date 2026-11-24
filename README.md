# headhunter-talent-sourcing

AI/ML 高端人才寻访与外联的 WorkBuddy/Claude Skill：在 GitHub 和 Google Scholar 上系统化寻找博士/研究员候选人，筛选、挖联系方式、写个性化外联邮件、节奏化跟进。

从真实猎头工作流沉淀：13 封冷邮件 → 2 个微信回应（15% 转化），验证了"求职声明 + 邮箱公开 + 方向对口"是最高转化筛选器。

## 方法论一图流

```
阶段0 定画像        阶段1 寻访            阶段2 筛选        阶段3 挖邮箱       阶段4 外联        阶段5 跟进
────────────  →   ──────────────────  →  ────────────  →  ───────────  →  ───────────  →  ──────────
方向/时间窗/地理/   A. 仓库贡献者扫描       一票否决          profile→主页→     个性化首段        3天 X互动+FU
客户可披露程度      B. 求职声明检索 ★       六维加权评分      论文→commit→     匿名化话术        7天收尾
                  C. 论文/学术路线        匿名化风险检查    学校目录          结尾留微信        微信约通话
                  D. 人脉枢纽反查                                                             名单全程记录
```

★ = 转化率最高的渠道：`"on the job market" PhD {year} "{direction}" site:github.io`

## 安装

```bash
# WorkBuddy / Claude Code 用户级技能目录
git clone https://github.com/Zacharyzheng-133/headhunter-talent-sourcing.git \
  ~/.workbuddy/skills/headhunter-talent-sourcing
```

依赖：`gh` CLI（已 `gh auth login`）。脚本仅需 bash。

## 目录

| 文件 | 内容 |
|---|---|
| `SKILL.md` | 五阶段主流程与红线 |
| `references/sourcing-playbook.md` | 四渠道打法、仓库清单、Google 查询式库、导师反查 |
| `references/screening-rubric.md` | 一票否决、六维评分、匿名化风险检查、背调清单 |
| `references/email-playbook.md` | 4 类邮件模板、发送时机（时区换算）、回复处理、名单文件格式 |
| `scripts/scan_contributors.sh` | 批量拉多个仓库的头部贡献者 |
| `scripts/fetch_profiles.sh` | 批量拉用户资料（TSV），含 commit 邮箱挖掘 |

## 快速上手

```bash
# 1. 扫仓库贡献者
bash scripts/scan_contributors.sh volcengine/verl OpenRLHF/OpenRLHF

# 2. 批量拉资料
bash scripts/fetch_profiles.sh user1 user2 user3 > candidates.tsv

# 3. 对 bio/blog 里有线索的，抓个人主页核实毕业时间和求职状态
# 4. 按 references/email-playbook.md 的模板写邮件，发出后记入名单文件
```

## 红线

- 不批量 follow（无触达价值）、不发 issue/PR 建联、不捏造信息
- 客户匿名化时，正文永不出现公司真名；候选人带教与客户创始人背景重叠的，先过风险检查再发
- 本仓库已脱敏：模板中的联系方式均为占位符，填入自己的信息使用

## License

MIT
