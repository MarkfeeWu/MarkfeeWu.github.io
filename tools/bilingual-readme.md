# 中英文页面使用说明

这是针对 MarkfeeWu/MarkfeeWu.github.io、Chirpy 7.6 准备的增量修改。

## 上传

把压缩包解压后，将其中的 `_data`、`_includes`、`_layouts`、`_plugins`、`assets`、`zh`、`tools` 文件夹一起拖到 GitHub 仓库的 **Add file → Upload files** 页面，保留目录结构，然后提交。只覆盖同名文件，不要删除仓库里原有的文件夹。

等待 Actions 的 Build and Deploy 成功，再刷新网站。如有“New content available”提示，点击 Update。

## 页面地址

| 英文 | 中文 |
| --- | --- |
| `/` | `/zh/` |
| `/publications/` | `/zh/publications/` |
| `/blogs/` | `/zh/blogs/` |
| `/tags/` | `/zh/tags/` |
| `/miscellaneous/` | `/zh/miscellaneous/` |

搜索框右侧的“中文 / English”按钮会切换到对应页面。论文页面的 `#paper-N` 定位也会保留。

## 中文姓名

编辑 `_data/bilingual.json`，在 `"zh-CN"` 下修改 `"profile_name"`。目前保留原来的 Pengfei Wu，未擅自推定中文姓名。

## 修改内容

- 英文首页：`index.html`。
- 中文首页、招生、动态、学术服务：`zh/index.html`。
- 英文论文数据：`_tabs/categories.md`。
- 论文中文译名：`_data/bilingual.json` 的 `papers` 数组。
- 期刊、会议中文名称：同一文件的 `venues` 数组。
- 中文其他资源：`zh/miscellaneous.html`。
- 中英文导航文字：`_data/locales/en.yml`、`_data/locales/zh-CN.yml`。

新增论文时，在英文列表中添加条目，并为 `papers` 数组补充原题和中文译名：

```json
{"en": "Original English Paper Title", "zh": "论文题目的中文译名"}
```

原题需要与英文列表中的文字一致，包括大小写和标点。中文论文页面会共享英文列表的作者、顺序、年份、标签和定位逻辑，无需另外维护一份论文列表。作者姓名、会议缩写、标识符保留原文。

## 以后写中英文博客

博客仍然放在 `_posts/`。同一篇文章的中英文文件使用相同的 `translation_key`，正文分别撰写。

英文文件示例：`_posts/2026-11-23-research-note-en.md`

```yaml
---
layout: post
title: Research Note
lang: en
translation_key: research-note
permalink: /posts/research-note/
tags: [research]
---
```

中文文件示例：`_posts/2026-11-23-research-note-zh.md`

```yaml
---
layout: post
title: 研究笔记
lang: zh-CN
translation_key: research-note
permalink: /zh/posts/research-note/
tags: [研究笔记]
---
```

博客列表、标签、最近更新、搜索、相关文章和上一篇/下一篇会按语言区分。没有另一种语言版本的博客文章，切换按钮会进入对应语言的博客列表。

`_config.yml` 中的 `lang: en` 保持不变，中文页面通过自己的 `lang: zh-CN` 设置语言。

## 功能检查

1. 英文首页搜索框右侧出现“中文”，点击打开 `/zh/`。
2. 中文页面的简介、招生信息、动态、学术服务及导航显示中文。
3. 点击“学术论文”，共有 40 篇论文；“会议论文”“期刊论文”等筛选正常。
4. 中文搜索“去重”或“STEAD”，点击结果定位并高亮目标论文。
5. 在目标论文处点击 English，回到英文版的同一篇论文。
6. 手机端侧栏、搜索、语言按钮、深浅色模式正常。

此修改沿用原来的 GitHub Pages 发布方式，没有迁移网站，也没有更改既有英文页面地址。
