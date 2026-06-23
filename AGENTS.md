# travel

川西15天自驾攻略页面（甘孜州东线深度游）。单 HTML 文件项目，无构建工具/依赖。

## 文件

- `index.html` — 主文件，自包含（CSS + JS 内联），无外部依赖（html2canvas + Leaflet CDN 除外）
- `线路图.png` — 自制路线示意图，在概括卡顶部显示

## 关键特性

- 响应式：PC ≥769px 960px 布局，手机/微信 ≤768px 480px 布局
- 左右滑动：`.h-scroll` 容器子元素手机左右滑动，PC 变 2 列网格
- 概况 + 设计说明合并为第一块卡，含路线图、三大本营表、每日 timeline、环线返程表
- 路线地图：Leaflet + 高德瓦片，去程灰线(成都→泸定→中谷村→甲根坝→八美)，返程绿线(环线·丹巴→四姑娘山→成都)
- D3 成都→泸定桥(游玩2h)→中谷村（顺路打卡，不走回头路）
- D11 环线返程（路过一天到成都 或 宿丹巴轻松走）
- 日历表：`renderCalendar()` 基于出发日期生成月历
- ICS 下载：`downloadICS()` 单条跨15天 VEVENT
- 清单勾选存入 `localStorage`（`check_item_N`）
- 23条小红书链接（带完整 xsec_token）嵌入各景点出处框
- 加油站提醒：中谷村/甲根坝/八美/四姑娘山
- 国道风景指南卡（G318/G350/S434/G548）
- 每个景点/酒店含高德、百度导航按钮 + 小红书搜索复制按钮

## 页面结构

- D1-D15 每天一个 `.day-card`，含行程、推荐理由、出处链接、住宿
- D3/D4/D5/D6/D7/D8/D9/D10/D11 的景点/住宿用 `.h-scroll` 包裹
- 独立卡片：行程概括+设计说明、路线地图、出行信息、行程总览、景点分级、国道指南、安全守则、高反手册、宠物方案、检查清单、日历
- 全部图片已移除（9张 picsum 占位图）

## Git 远程

origin → https://gitee.com/kevinduyang/travel.git

## 注意

- 主文件是 `index.html`（Gitee Pages 默认入口）
- 有图片时 git add 需加 `"线路图.png"`
- 修改后 `git add "index.html" ["线路图.png"] && git commit -m "msg" && git push`
