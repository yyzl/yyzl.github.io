
## 使用

首先，安装 hexo-cli 工具，并复制代码仓库到本地，接着安装依赖：

```bash
npm install hexo-cli -g
git clone git@github.com:AngusFu/blog.git
cd blog
npm install
```

接下来，请务必修改 `./themes/apollo/_config.yml` 中的这些配置项：

```yaml
menu:
  ## 请根据您自己的需要进行修改、配置

favicon: /favicon.ico

## 在 `./themes/apollo/source/img/` 目录中设置 logo 图片
## 建议尺寸：110*60
logo: /img/avatar.jpg 

# Comment
## 如果没有 请删除
## 使用请参考 https://github.com/imsun/gitment
gitment:
    user: ...
    repo: ...
    id: ...
    secret: ...

# Analytics
# google-analytics:
ga: 您的 google analytics ID

# 360 分析的 domainId
## see https://fenxi.360.cn
qha: 12345
```

第三步，删除 `./source/_posts/` 目录下所有的 markdown 文件，删除 `./source/caniuse/` 文件夹：

```bash
rm ./source/_posts/*.md && rm -rf ./source/caniuse/
```

第四步，修改 `/source/CNAME` 文件，配置为您自己的域名；

第五步，修改 `./_config.yml` 中的关键信息：

```yaml
title: 文蔺的前端之路
subtitle: 
description: 文蔺的前端学习记录，国外技术文章翻译，个人学习心得等等这些都会记录在这里。
author: 文蔺
language: zh-cn
timezone:
## 用于版权声明
github: 'https://github.com/AngusFu'

# 赞赏二维码
## 记得修改
donatePic: 'http://7te985.com1.z0.glb.clouddn.com/donate.png'

# URL
url: http://www.wemlion.com
```

此外，如果您不需要图片懒加载功能，请删除 marked 字段下的 lazyAttr 和 blankSrc：

```yaml
# 修改后的 markdown 转换
marked:
    gfm: true
    ## lazy-load 图片
    lazyAttr: data-orig
    blankSrc: http://7te985.com1.z0.glb.clouddn.com/placeholder.png 
```

第六步，添加文章：

```bash
# 添加原创文章
hexo new '文章 title'
# 添加译文
hexo new trans '译文'
```

也可以直接将您原有的 markdown 文件复制到 `./source/_posts` 目录中去。

然后记得 commit、push 代码到 github 上去。

**注意**：下面的步骤也可以不用。那么，请修改 ./release.sh 中相应的内容，并全局安装 `hexo-cli` `postcss-cli` `autoprefixer`，然后给该文件添加权限`chmod 755 ./release.sh`。最后运行该文件即可。

第七步（如果你不适应这一步，也可以忽略，自己配置下 hexo-deployer 也是可以的），启用 travis-ci 工具。参考教程：[手把手教你使用Travis CI自动部署你的Hexo博客到Github上](http://www.jianshu.com/p/e22c13d85659)。跟着教程做完之后，记得修改 `./travis.yml` 文件中对应的一些信息，主要需要修改以下几个地方：

```yaml
- git config user.name "wemlion"
- git config user.email "angusfu1126@qq.com"
  
- GH_REF: github.com/AngusFu/blog.git
```

另外，还有一段需要删除的（这是我用来将文件同步到另一个站点的，你可能不需要吧）：

```yaml
# commit yyzl.github.io
- rm ./CNAME
- rm -rf .git
- git init
- git config user.name "wemlion"
- git config user.email "angusfu1126@qq.com"
- git add .
- git commit -m "Update docs"
- git push  --force --quiet" https://${GH_TOKEN}@${GH_REF}" master:master
```

接下来，就可以愉快地使用你的博客啦~ 无需在本地运行预览哈（如果需要，也是可以的，`npm start` 即可）~ 每次写文章，都可以在 github 上直接在线新建文件（进入 `./source/_posts/` 目录，找到 `Create new file` 按钮，修改文章也是同理）。

如果有任何问题，请随时联系我哈~

## 鸣谢：
感谢[pinggod](https://github.com/pinggod/) 制作的 [hexo-theme-apollo](https://github.com/pinggod/hexo-theme-apollo)主题。
我的博客，全部是基于该主题进行修改、定制的。如果您觉得还不错，请给 @pinggod 童鞋 star 吧！


