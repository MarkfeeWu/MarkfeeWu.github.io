# 修正版：仅 Home 提供中文

此补丁用于覆盖上一版已经上传的双语包。解压后，把包内文件夹拖到 GitHub 仓库根目录的 Add file → Upload files 页面，保留目录结构并提交；不要直接上传 ZIP，也不要删除原有文件夹。

- 英文首页：/；中文首页：/zh/。
- 只有中英文首页的搜索框右侧显示“中文 / English”切换按钮。
- 中文首页的“学术论文”链接直接打开英文 /publications/。
- 标签、博客、其他资源也都进入英文页面。
- 搜索使用原来的英文论文索引，结果直接定位到英文论文页面。
- 旧的 /zh/publications/、/zh/blogs/、/zh/tags/、/zh/miscellaneous/ 自动跳转到英文对应页面，论文编号定位也会保留。
- 旧包中的论文译名数据不再用于页面展示，无需手动删除文件。

提交后等待 Actions 成功。如网页出现 New content available，点击 Update 后刷新，以更新上一版缓存。
