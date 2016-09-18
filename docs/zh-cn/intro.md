<!-- toc -->

## cooking 是什么
cooking 是一个基于 webpack 但是提供更简单的配置项，同时内置了许多常用配置的构建工具。同时搭配

命令行工具可以将常用开发环境的依赖 (devDependencies) 安装全局，并且提供的脚手架功能能快速搭建

基于 Vue 或 React 的项目。

## 简单上手
### cooking-cli
> 一个基于 webpack 2 的全局安装的命令行工具，全局安装依赖，可以省去在每个项目里安装开发依赖的
麻烦；同时还包含脚手架、插件管理等功能。

**首先确保是在 `NPM 3+`, `Node 4+`, `Python 2.7+` 环境下运行**

第一步：安装 cooking 命令行工具
```bash
npm i cooking-cli -g
```

第二步：使用创建项目
```bash
cooking create my-project vue
```

第三步：开始开发
```bash
cd my-project && cooking watch
```

后续：打包、测试等
```bash
cooking build # or cooking run test
```

## cooking
> cooking-cli 的核心部分。提供简化 webpack 配置，以及的 build/watch 指令。不包含任何依赖。
同时兼容 webpack 1 和 2。


第一步：安装 cooking
```bash
npm i cooking -D
```

第二步：安装相关依赖
```bash
# webpack 1
npm i babel-core babel-loader css-loader file-loader postcss postcss-loader\
 html-loader html-webpack-plugin json-loader style-loader url-loader\
 webpack@1 webpack-dev-server@1 extract-text-webpack-plugin@1 -D

# webpack 2
npm i babel-core babel-loader css-loader file-loader postcss postcss-loader\
 html-loader html-webpack-plugin json-loader style-loader url-loader\
 webpack@beta webpack-dev-server@beta extract-text-webpack-plugin@beta -D
```

第三步：写 cooking 的配置

cooking.conf.js
```javascript
var cooking = require('cooking')

cooking.set({
  entry: './src/index.js',
  dist: './dist'
})

module.exports = cooking.resolve()
```

第四步：运行
```bash
# 开始开发
node_modules/.bin/cooking watch

# 打包
node_modules/.bin/cooking build

# 当然可以用 webpack 启动
webpack --config cooking.conf.js

# 如果你全局安装了 cooking-cli 同样也可以使用
cooking watch # or build
```
