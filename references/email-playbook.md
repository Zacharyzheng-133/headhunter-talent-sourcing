# Email Playbook — 外联邮件与跟进

占位符约定：`{FIRST_NAME}` 候选人名、`{SPECIFIC_WORK}` 其具体工作、`{WHY_RELEVANT}` 与岗位的关联、`{CLIENT_PITCH}` 客户匿名化描述、`{YOUR_NAME}`、`{YOUR_WECHAT}`、`{TIMEZONE}`。

## 撰写铁律

1. **首段点名具体工作**：必须出现对方的论文/项目名 + 一句话说明为什么相关。这是与模板邮件的唯一分水岭
2. **公司描述匿名化**：四要素——阶段（early-stage）、做什么（产品+商业化状态）、技术焦点、背书（基金级别）。创始人背景只写"前头部团队核心技术出身，电话聊"
3. **正文永不出现公司真名、薪资数字**（除非客户明确放开）
4. **结尾留微信号**：实测回复几乎全部来自微信，邮箱回复极少
5. **一个 CTA**：20 分钟技术聊天，不提 pitch deck，不施压
6. **长度**：150-200 英文词，手机上三屏内读完

## 模板 1：首封触达（标准版）

```
Subject: {direction} role — {SPECIFIC_WORK} caught our attention

Hi {FIRST_NAME},

I'm a researcher-talent partner working with an early-stage AI company
({GEO}, backed by a top-tier US dollar fund). I'll keep this short —
I know your inbox is full of these.

What caught my attention: {SPECIFIC_WORK_1} and {SPECIFIC_WORK_2}.
{WHY_RELEVANT — 一句话把对方工作和岗位方向连起来}

About the opportunity (anonymized for confidentiality):
- Early-stage, deeply technical team; {PRODUCT_DESCRIPTION}
- Core focus: {TECH_FOCUS}
- Founder previously held core technical leadership at a top LLM team —
  details on a call
- Founding-team-level seat, real equity, direct founder access

{PERSONAL_HOOK — 地理/校友/时间线相关的个人化一句}

Would you be open to a 20-minute technical chat this week?
Happy to work around {TIMEZONE}.

Best,
{YOUR_NAME}
WeChat: {YOUR_WECHAT}
```

## 模板 2：长线建联（时间窗超 1 年以上者）

```
Subject: {direction} research — early connection

Hi {FIRST_NAME},

I noticed you're on the {YEAR} job market / graduating in {YEAR}.
This is an early reach-out — I'd rather plant a seed now than
cold-contact you in a year.

{一段客户匿名化描述 + 为什么其方向对口}

I'm not asking for a decision 12 months early. If you're open to it,
I'd value a 15-20 minute conversation about your research direction
and where you want to take it. No pitch, no pressure.

Best,
{YOUR_NAME}
WeChat: {YOUR_WECHAT}
```

## 模板 3：Follow-up（3 天无回复）

```
Subject: Re: {原主题}

Hi {FIRST_NAME},

Following up once — {一句新增价值点：补充一个之前没提的卖点，如对方工作与公司技术栈的具体结合点}.
Still happy to share founder background and technical roadmap on a
short call if the timing works.

Best,
{YOUR_NAME}
```

## 模板 4：收尾（7 天无回复）

```
Subject: Re: {原主题}

Hi {FIRST_NAME},

Last note from me — the role is still open and your {SPECIFIC_WORK}
remains the closest fit I've seen. If the timing is ever right,
my WeChat is {YOUR_WECHAT}. Good luck with {其当前的事：paper/实习/答辩}.

Best,
{YOUR_NAME}
```

## 发送时机

- 按**对方时区的上午 8-10 点**投递（打开率最高）
- 北美东部 UTC-5 ≈ 北京时间 21:00-23:00；北美西部 UTC-8 ≈ 北京时间 00:00-02:00（提前发或定时）；欧洲 UTC+1 ≈ 北京时间 15:00-17:00；新加坡/香港无时差
- 避开周一早晨和周五下午

## 发件与投递

- 域名优先级：公司域名 > 绑定邮箱（如 QQ/163）> 通用免费邮箱。域名是候选人的第一道筛选
- 发出后**必须查已发送文件夹确认投递**（queued ≠ delivered）
- 同一轮多封邮件主题避免雷同，防被批量归档

## 回复处理

- **加微信**：当天发欢迎消息并约 15-20 分钟通话。第一通电话摸底五件事：时间线、看机会的动机、竞对进度、地理接受度、priority 排序（钱/自由度/论文/位置/团队）
- **邮件回复感兴趣**：24 小时内回，推进到通话
- **婉拒**：问一句"是否方便推荐同方向的朋友"，进长线池
- **问公司名**：口径统一——"电话聊时披露"，不在文字中写

## 名单文件格式（寻访过程的单一事实源）

```markdown
# {方向} 人才寻访名单
> 目标画像：{画像一句话}
> 客户：{匿名化描述}
> 寻访日期 / 已扫池子：{仓库、查询式清单}

## A 级：立即触达
### {姓名} — {一句话定位}
| 项 | 内容 |
|---|---|
| GitHub/主页 | ... |
| 身份 | 学校、年级、导师、本科 |
| 方向 | ... |
| 代表作 | ... |
| 邮箱 | ... |
| 状态 | 已发邮件 / 已加微信 / 待跟进 |
| 备注 | 风险点、切入点 |

## B/C 级：长线池与备选（同上，注明为什么降级）
## 已排除（含原因，备查）
## 已发送邮件记录（日期 | 收件人 | 主题）
## 跟进节奏（3 天 / 7 天节点与动作）
```
