#!/usr/bin/env bash
# scan_contributors.sh — 批量拉取多个 GitHub 仓库的头部贡献者
#
# 用法:
#   bash scan_contributors.sh owner/repo1 owner/repo2 ...
#   bash scan_contributors.sh -n 20 volcengine/verl OpenRLHF/OpenRLHF
#
# 输出: 每个仓库一段，列出按贡献数排序的 login（去重前的原始顺序）
# 依赖: gh CLI 已登录（gh auth login）
#
# 提示: 搜索结果合并后应人工去重，再用 fetch_profiles.sh 批量拉资料

set -u

PER_PAGE=12
if [ "${1:-}" = "-n" ]; then
  PER_PAGE="$2"
  shift 2
fi

if [ $# -lt 1 ]; then
  echo "Usage: bash scan_contributors.sh [-n per_page] owner/repo [owner/repo ...]" >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "ERROR: gh CLI not found. Install from https://cli.github.com/" >&2
  exit 1
fi

for repo in "$@"; do
  echo "=== $repo ==="
  if ! gh api "repos/$repo/contributors?per_page=$PER_PAGE" --jq '.[].login' 2>/dev/null; then
    echo "(failed: repo not found or API error)" >&2
  fi
  sleep 0.3  # 温和限速，避免触发 search/api 限流
done
