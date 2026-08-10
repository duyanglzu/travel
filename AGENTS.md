# travel

川西17天自驾攻略页面（甘孜州东线深度游）。单 HTML 文件项目，无构建工具/依赖。

## 文件

- `index.html` — 主文件，自包含（CSS + JS 内联），无外部依赖
- `route-map.jpg` — 自制路线示意图，在概括卡顶部显示

## 调研工作流

本项目内容调研依赖以下工具链：

- **agent-reach 技能** — 搜索小红书、抖音获取实时用户攻略、路线验证、住宿评价
- **高德地图 MCP** — `amap_search_place` 查POI/坐标，`amap_nav` 路线规划，`amap_optimize_route` 多点顺路排序
- **百度地图 MCP** — `baidu_search_place` 查POI/坐标，`baidu_nav` 路线规划，`baidu_optimize_route` 多点顺路排序
  > ⚠️ 百度API并发数不能超过3个，需串行或分批调用
- **高德地图 MCP** — `amap_search_place` 查POI/坐标，`amap_nav` 路线规划，`amap_optimize_route` 多点顺路排序

所有酒店/景点推荐均需通过高德/百度可搜到，并经小红书验证后加入出处表。

## 关键特性

- 响应式：PC ≥769px 960px 布局，手机/微信 ≤768px 480px 布局
- 左右滑动：`.h-scroll` 容器子元素手机左右滑动，PC 变 2 列网格
- 概况 + 设计说明合并为第一块卡，含路线图、三大本营表、每日 timeline、环线返程表
- 路线地图：静态瓦片图 route-map-tiles.jpg，去程黑线(成都→泸定→康定→甲根坝→八美→道孚)，返程绿线(金小路·道孚→金川→小金→四姑娘山→映秀→成都)
- D4 成都→泸定桥(游玩2h)→雅家埂垭口→康定（大本营① 2500m 连住3晚）
- D7 康定→折多山→甲根坝（大本营② 3000m 连住3晚）
- D12 道孚→金川(255km/5h)→金小路S451(88km/1.5h)→小金
- D13 小金→四姑娘山(猫鼻梁)→映秀→重庆
- D12-D14 道孚→金川→金小路→小金→四姑娘山→映秀→重庆→武汉→上海
- 日历表：`renderCalendar()` 基于出发日期生成月历
- ICS 下载：`downloadICS()` 单条跨17天 VEVENT
- 清单勾选存入 `localStorage`（`check_item_N`）
- 23条小红书链接（带完整 xsec_token）嵌入各景点出处框
- 加油站提醒：康定/新都桥/八美/四姑娘山
- 国道风景指南卡（G318/G350/S434/G548/S451金小路）
- 每个景点/酒店含高德、百度导航按钮 + 小红书搜索复制按钮

## 页面结构

- D1-D17 每天一个 `.day-card`，含行程、推荐理由、出处链接、住宿
- D4/D5/D6/D7/D8/D9/D10/D11 的景点/住宿用 `.h-scroll` 包裹
- 独立卡片：行程概括+设计说明、路线地图、出行信息、行程总览、景点分级、国道指南、安全守则、高反手册、宠物方案、检查清单、日历
- 全部图片已移除（9张 picsum 占位图）

## Git 远程

- origin → git@gitee.com:kevinduyang/travel.git (Gitee)
- github → git@github.com:duyanglzu/travel.git (GitHub)
- atomgit → git@atomgit.com:duyanglzu/travel.git (AtomGit)

## 架构变更记录

- **v9 (2026.08.11)**：D5 改 S434 环线方案（机场观景台野餐→机场路→G318→折多山→康定，实测 52.5km 比原路返近），塔公/姑弄村留给 D10 承接；部署迁移至 test2.lzush.cn 静态站
- **v8 (2026.07.29)**：备份版功能补全(日历/Toast/动画/主题)、返回栏、手账主题默认、去主题按钮留深浅开关、花生壳Drop部署
- **v5.0 (2026.07.05)**：页面布局三段式重构（概览→每日行程→出行准备）、安全+高反合并为单卡、酒店预订快捷入口、4项代码bug修复
- **v4.0 (2026.07.02)**：路线重构：丹巴→金小路替换（D12 道孚→金川→金小路→小金）、D11卡玛村替代墨石公园、总览表/景点表同步更新、国道G350修正
- **v3.2 (2026.07.02)**：大本营②甲根坝 D7-D9 重构：住宿全换、月亮湖砍掉（绕路+收费）、D8新增夺让村土拨鼠/亚拢沟/提吾村B线、D9改为纳梯村/捡菌子/休闲
- **v3.1 (2026.07.03)**：景点分级表大改(增9删8+出处列)、每日出发时间规划、时间提醒/导航警告、地图换瓦片图、酒店预订卡、理想L6纯电版充电指南、涟漪效果移除、微信/手机浏览器字号修复
- 大本营① 中谷村→康定（2026.07）：D4榆磨路雅家埂垭口，D5 S434北线，D6老城区/博物馆/中谷村温泉备选
- 大本营② 甲根坝重构（2026.07）：住宿全换（宗宫/共梦林/木雅首府等），月亮湖砍掉（绕路+收费），D8新增夺让村土拨鼠/亚拢沟/提吾村B线，D9改为纳梯村/捡菌子/休闲
- **v3.3 (2026.07.08)**：大本营③道孚重构：D10顺游八美三景(墨石公园/惠远寺/泰宁古镇)，D11玉科草原+灵雀寺，D12重构为金小路路线(道孚→金川→金小路→小金)，D13起点改为小金，跳过丹巴（回头路）
- **Leaflet 交互地图 → route-map.jpg 静态图片（2026.07）**：去掉 Leaflet CDN 依赖，改用 route-map.jpg 静态图片展示路线，保留下方图例
- 国道指南修复：G318(D4/D7)、G350(D13)、新增金小路S451

## 部署

- **test2.lzush.cn 静态站（主）**：https://test2.lzush.cn/duyang/travel/1d33d85d/west-sichuan.html
  - VPS：中国 VPS（Debian 13），1Panel 面板建站，站点路径含随机串目录防扫描
  - 线上根目录：`/opt/1panel/www/sites/test2.lzush.cn/index/duyang/travel/1d33d85d/`（完整站点文件：HTML + themes/ + assets/ + 图片）
  - 更新：`sudo cp <本地文件> /opt/1panel/www/sites/test2.lzush.cn/index/duyang/travel/1d33d85d/`（目录 root 属主需 sudo，静态文件直接生效无需重载 nginx）
  - 验证：`curl -s -o /dev/null -w "%{http_code}" https://test2.lzush.cn/duyang/travel/1d33d85d/west-sichuan.html` 应返回 200
- **花生壳 Drop（备选）**：https://console-hsk-ng.oray.com/console/file-hosting
  - 打包所有 HTML + assets + themes + 图片为 ZIP
  - 拖拽上传即可生成远程访问链接，适合临时分享给同行人员
  - 分享链接（最新发布）：https://drop.ficp.fun/

## 注意

- 主文件是 `index.html`
- 修改后 `git add "index.html" && git commit -m "msg" && git push`
- 所有住宿推荐需高德/百度可搜到，小红书验证后加入出处表

## 版本号同步（每次发版必做）

版本号出现在 4 处，**漏改一处就是旧版**：

| 位置 | 格式 | 说明 |
|---|---|---|
| `index.html` 页脚 versionTop | vX.Y | 主页面 |
| `west-sichuan.html` 页脚 VER + 版本历史表首行 | vX | JS 变量 + 表格变更描述 |
| `paired-trip.html` 页脚 | vX.Y | 对方视角版 |
| `CHANGELOG.md` 顶部 | vX (日期) | 变更描述 |

流程：
1. `./bump-version.sh vX.Y` — 自动替换上述版本号（west-sichuan.html 自动取主版本 vX）
2. 手动补充：west-sichuan.html 版本历史表首行 + CHANGELOG.md 顶部 + AGENTS.md 架构变更记录（描述变更内容）
3. `git add -A && git commit && git push` 三远程
4. 同步部署：`sudo cp index.html west-sichuan.html paired-trip.html /opt/1panel/www/sites/test2.lzush.cn/index/duyang/travel/1d33d85d/` + curl 验证 HTTP 200
