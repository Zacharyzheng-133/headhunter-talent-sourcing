---
name: headhunter-talent-sourcing
description: AI/ML 高端人才寻访与外联全流程。当用户需要在 GitHub 和 Google Scholar 上寻找特定研究方向（如 LLM post-training、RLHF、RLVR、agentic RL、RSI、推理、Agent）的博士/研究员候选人、筛选匹配度、挖掘联系方式、撰写并发送个性化英文外联邮件、跟进转化时使用。适用于猎头、招聘、人才 mapping、建联、sourcing、outreach、候选人筛选等场景。This skill should be used when sourcing AI/ML PhD candidates or researchers on GitHub and Google Scholar, screening them against a target profile, finding their contact info, and running personalized email outreach campaigns.
agent_created: true
---

# AI Talent Sourcing & Outreach

面向 AI/ML 研究岗位的系统化寻访与外联流程。核心方法论：**仓库贡献者扫描 → 求职声明检索 → 硬条件筛选 → 多渠道挖邮箱 → 个性化邮件外联 → 节奏化跟进**。

实战验证过的关键认知：**"挂了求职声明 + 邮箱公开 + 方向对口"的候选人转化率远高于背景光鲜但不主动的大牛**。优先触达前者，后者进长线池。

## 阶段 0：锁定目标画像

开始前必须明确四项硬条件，缺一就先问用户：

1. **研究方向关键词**：如 post-training / RLHF / RLVR / agentic RL / self-improving agents
2. **时间窗**：如"博士毕业后 1-3 年经验"或"某届应届"——最常用的一票否决条件
3. **地理/身份偏好**：海外博士、华人、目标 base 城市
4. **客户可披露程度**：公司是否匿名化、创始人背景是否可提——决定邮件话术和匿名化风险检查（见 references/screening-rubric.md）

## 阶段 1：寻访（四渠道，按优先级）

**渠道 A — GitHub 仓库贡献者扫描**：从领域核心开源仓库（post-training 框架、agentic RL 框架等）拉头部贡献者，逐个查 profile。用 `scripts/scan_contributors.sh` + `scripts/fetch_profiles.sh` 批量执行。仓库清单见 references/sourcing-playbook.md。

**渠道 B — 求职声明检索（转化最高）**：Google 搜索 `"on the job market" PhD {year} "{direction}" site:github.io` 及其变体。命中者自带三个筛选器：主动求职、邮箱通常公开、方向自述清晰。查询式库见 references/sourcing-playbook.md。

**渠道 C — 论文/学术路线**：Google Scholar、arXiv 近两年顶会论文一作、各校 PhD job market 页面（如 Berkeley BAIR cohort）、实验室导师 group members 页面反查。

**渠道 D — 人脉枢纽**：领域内团队 Lead / 实习带教的论文合作者网络。超窗的资深人选不当候选人，当转介绍节点。

每个渠道挖 1-2 轮后边际收益骤降，及时换渠道，不要在同一池子里翻第三轮。

## 阶段 2：筛选

按 references/screening-rubric.md 执行：

- **一票否决**：毕业时间超窗、学历不符（要博士的岗不收硕士）、刚入职新公司、方向零交集
- **加权评分**：学历背景、毕业时间、方向对口度、工程栈、论文质量、地理适配
- **匿名化风险检查**：候选人的导师/实习带教/现雇主若与客户背景重叠（如创始人前东家），暂缓触达并记录原因

## 阶段 3：挖联系方式

按此顺序，命中即停：

1. GitHub profile 的 email 字段和 bio
2. 个人主页（`.github.io` 或 blog 字段）——最可靠的来源
3. 代表论文的通讯邮箱（arXiv HTML 全文脚注）
4. GitHub commit 历史邮箱（`scripts/fetch_profiles.sh` 中有示例；注意 `users.noreply.github.com` 地址不转发邮件，无效）
5. 学校 directory、ORCID、Google Scholar 主页

全找不到则留档标注"邮箱待查"。不要发 GitHub issue，不要硬猜邮箱。

## 阶段 4：外联邮件

按 references/email-playbook.md 撰写和发送：

- **个性化是底线**：首段必须点名对方 1-2 项具体工作并说明为什么相关，禁止模板感
- **匿名化话术**：公司、创始人、薪资按客户可披露程度模糊化，正文绝不写公司真名
- **结尾留微信**：转化关键动作，回复者基本都从微信来
- **发送时机**：按对方所在时区的上午 8-10 点投递
- **发件域名**：专业域名 > 个人邮箱；发出后查已发送文件夹确认投递

## 阶段 5：跟进与转化

- **3 天无回复**：先在 X/Twitter 互动对方近期技术推文，再发 follow-up
- **7 天无回复**：最后一封短邮件收尾，转入长线池，不纠缠
- **对方加微信后**：当天约 15-20 分钟通话；第一通电话摸底（时间线、动机、竞对、地理接受度、priority 排序），不急着推职位；微信里维持与邮件一致的匿名化口径
- 全过程记录到寻访名单文件（格式见 references/email-playbook.md 末尾），含已发送邮件日志和回应状态

## 文件指引

- `references/sourcing-playbook.md` — 四渠道详细打法、仓库清单、Google 查询式库、导师/实验室反查清单
- `references/screening-rubric.md` — 加权评分表、一票否决清单、匿名化风险检查
- `references/email-playbook.md` — 首封/follow-up/长线三类邮件模板、发送时机、匿名化规则、名单文件格式
- `scripts/scan_contributors.sh` — 批量拉取多个 GitHub 仓库的头部贡献者
- `scripts/fetch_profiles.sh` — 批量拉取 GitHub 用户资料输出 TSV，含 commit 邮箱挖掘示例

## 红线

- 不批量关注候选人（GitHub follow 无触达价值，且普通 token 无 user scope）
- 不通过 GitHub issue/PR 联系候选人
- 不捏造候选人信息；核实不了的标注"待确认"，在邮件或汇报中直接问
- 名单、邮件、脚本中不出现用户的私人联系方式和客户真实身份——用占位符
