#!/usr/bin/env bash
# 版本号同步脚本 — 一键更新所有页面版本号，防止漏改
# 用法: ./bump-version.sh v9.0
# 注意: 脚本只替换版本号，版本历史表/CHANGELOG/AGENTS 的变更描述需手动补充
set -euo pipefail

VER="${1:?用法: ./bump-version.sh <版本号> 例如 v9.0}"
# 主版本号（west-sichuan.html 的 VER 用 v9 格式）
MAJOR="v$(echo "$VER" | sed -E 's/^v([0-9]+).*/\1/')"

cd "$(dirname "$0")"

# 1. index.html — 页脚 <span id="versionTop">vX.Y</span>
sed -i -E "s/(id=\"versionTop\">)v[0-9.]+/\1$VER/" index.html

# 2. paired-trip.html — 页脚 "vX.Y · 对方视角版"
sed -i -E "s/v[0-9.]+ · 对方视角版/$VER · 对方视角版/" paired-trip.html

# 3. west-sichuan.html — JS 变量 const VER = 'vX'
sed -i -E "s/(const VER = ')[^']+(')/\1$MAJOR\2/" west-sichuan.html

echo "✅ 版本号已更新为 $VER（west-sichuan.html 用 $MAJOR）"
echo "⚠️  手动补充：west-sichuan.html 版本历史表首行 / CHANGELOG.md / AGENTS.md 变更记录"
