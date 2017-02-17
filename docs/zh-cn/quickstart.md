<!-- toc -->

# 全局安装

**只能使用 NPM 3 及其以上的版本**

```bash
$ npm i cooking-cli -g
```

如果国内速度慢的话可以选择使用国内镜像，例如 taobao 镜像
```bash
$ npm i cooking-cli -g --registry=https://registry.npm.taobao.org
```

# 创建第一个项目 (Vue 举例)
```bash
$ cooking create my-project vue
```

这里 cooking 做了两件事，先是创建了一个 my-project 目录，然后下载 vue 脚手架并执行，以后就不用再下载。最后得到的项目结构与[例子](example.md)相似。如果已经创建了项目目录，直接通过 `cooking init vue` 初始化。

## 开发模式
默认将启动一个 server，当然如果只需要监听文件变化并自动打包，改一下配置  `devServer: false` 或去掉即可。

```bash
$ cooking watch
```

## 构建
打包压缩文件，并输出到指定目录下
```bash
$ cooking build
```

# 视频演示
<div style="position: relative; padding-bottom: 65%; height: 0;">
  <iframe style="position: absolute; height: 100%; width: 100%;" src="http://player.youku.com/embed/XMTU1NDI1OTgwOA==" frameborder=0 allowfullscreen></iframe>
</div>