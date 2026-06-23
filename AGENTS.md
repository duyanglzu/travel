# travel

川西15天自驾攻略（甘孜州东线深度游）。单 HTML 文件，无构建工具。

## 关键文件

- `index.html` — 唯⼀主文件，CSS+JS 内联
- `route-map.png` — 路线图，在⾸卡顶部
- `15天川西2.html` — 旧版本，勿动
- `AGENTS.md`、`CHANGELOG.md`、`LICENSE` — ⽂档类

## 架构速览

| 层 | 说明 |
|---|---|
| 响应式 | PC ≥769px 960px 布局 / 手机 ≤768px 480px 布局 |
| 外部依赖 | Leaflet 1.9.4 unpkg + html2canvas 1.4.1 jsdelivr（仅这俩 CDN） |
| 卡片系统 | 节卡 `<div class="card"><details>`（默认折叠：景点分级表、出处汇总表） |
| 天卡 | `<div class="day-card"><details open>`（默认展开），`.day-title` 蓝渐变，`.day-content` ⽩底 |
| 横向滚动 | `.h-scroll` ⼦元素在手机端左右滑动，PC 端变 2 列⽹格 |
| 交互 | 清单勾选存 `localStorage`（key: `check_item_N`）、ICS 下载 `downloadICS()`、⽇历 `renderCalendar()` |
| 路线⾼亮 | D3 成都→泸定桥(游玩2h)→中⾕村（顺路打卡），D11 环线返程（路过⼀天到成都 / 宿丹巴轻松⾛） |

## 关键命令

```powershell
# 修改后推送（两远程）
git add "index.html" "route-map.png" && git commit -m "msg"
git push origin master && git push github master
```

`origin` → `git@gitee.com:kevinduyang/travel.git` (SSH)
`github` → `git@github.com:duyanglzu/travel.git` (SSH)

## 开发注意事项

- **只改 `index.html`**，`15天川西2.html` 是过时副本
- 所有样式修改在 `<style>` 标签内（约 L10-255），JS 在⽂件末尾 `<script>`（约 L1478-1945）
- 携程酒店链接格式：`https://hotels.ctrip.com/hotel/{id}`
- ⾼德/百度导航按钮已内置，新增景点时需加两个链接
- 加油站提醒固定在 G318/S434 ⼏个节点（中⾕村/甲根坝/⼋美/四姑娘⼭）
- 路线地图使⽤ Leaflet + ⾼德⽡⽚（⽆ API key），去程灰线、返程绿线、⽇游⻩线
- GitHub Pages 未激活（需 Settings → Pages → master / (root) → Save）
- Gitee token 已撤销，只⽤ SSH
