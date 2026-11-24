#!/usr/bin/env bash
# fetch_profiles.sh — 批量拉取 GitHub 用户资料，输出 TSV
#
# 用法:
#   bash fetch_profiles.sh login1 login2 login3 > candidates.tsv
#   bash fetch_profiles.sh -c owner/repo login   # 附带挖该用户在此仓库的 commit 邮箱
#
# 输出列: login, name, company, location, bio, blog, email, twitter, followers
#
# 筛选线索:
#   - email 含 .edu / connect.xxx.edu => 在读学生
#   - bio 含 "job market" / "seeking" => 主动求职，优先级最高
#   - blog 非空 => 下一步抓个人主页（毕业时间、导师、论文、求职声明）
#
# commit 邮箱挖掘（-c 模式）:
#   从指定仓库的提交记录取作者邮箱。注意 users.noreply.github.com 是 GitHub
#   占位地址，不转发真实邮件，视为无效。

set -u

COMMIT_REPO=""
if [ "${1:-}" = "-c" ]; then
  COMMIT_REPO="$2"
  shift 2
fi

if [ $# -lt 1 ]; then
  echo "Usage: bash fetch_profiles.sh [-c owner/repo] login [login ...]" >&2
  exit 1
fi

for u in "$@"; do
  gh api "users/$u" --jq '[.login, (.name//""), (.company//""), (.location//""), (.bio//""|gsub("\n";" ")|.[0:150]), (.blog//""), (.email//""), (.twitter_username//""), (.followers|tostring)] | @tsv' 2>/dev/null \
    || echo -e "$u\t(fetch failed)"

  if [ -n "$COMMIT_REPO" ]; then
    emails=$(gh api "repos/$COMMIT_REPO/commits?author=$u&per_page=10" --jq '.[].commit.author.email' 2>/dev/null | grep -v 'noreply.github.com' | sort -u | tr '\n' ',')
    echo -e "$u\tcommit-emails:\t${emails:-none}"
  fi

  sleep 0.3
done
