# 迁移指南

以 vue-cli 创建的项目举例。

## 开始
新建一个 cooking.conf.js 文件，并添加基本配置
```javascript
var cooking = require('cooking')

cooking.set({

})

module.exports = cooking.resolve()
```

## entry
同 webapck entry 直接拷贝进来
```javascript
{
  entry: {
    app: './src/main.js'
  }
}
```

## output
默认输出路径为 `./dist`，publicPath 为 `/dist/`，如果一致可不设置
```javascript
{
  publicPath: '/dist/',
  dist: './dist',
  assetsPath: 'static'
}
```

## loader
cooking 默认提供了 `css`、`html`、`images`、`json` 的 loader，因此 `build/webpack.base.conf.js` 中的 loader 基本包含，额外的需要 vue-loader 和 eslint-loader，只需在配置中增加插件
```javascript
{
  extends: ['vue', 'lint']
}
```

## resolve
alias 需要自己配置，默认不提供
```javascript
cooking.add('resolve.alias', {
  'src': path.resolve(__dirname, '../src'),
  'assets': path.resolve(__dirname, '../src/assets'),
  'components': path.resolve(__dirname, '../src/components')
})
```

## dev server
cooking 提供的 dev server 为 webpack 提供的 webpack-dev-server，配置参数[参考文档](http://webpack.github.io/docs/webpack-dev-server.html)，可直接使用默认配置
```javascript
{
  devServer: true
}

// 以下是默认配置
{
  devServer: {
   // 需要注意的是这里的 publicPath 会替换掉上面配置的 publicPath，与官方文档相反
    publicPath: '/',
    port: 8080,
    hot: true,
    enable: true,
    historyApiFallback: true,
    lazy: false,
    stats: 'errors-only',
    protocol: 'http:',
    hostname: 'localhost'
  }
}
```

## ExtractTextPlugin
只需配置 extractCSS 参数即可
```javascript
{
  extractCSS: true
}
```

## HtmlWebpackPlugin
模板文件如果无特殊配置直接设置文件路径

```javascript
  template: './index.html'
```

## 最终文件
额外的补上 use、hash、clean、sourceMap 参数，最终配置将原先数个文件上百行的配置简化成如下配置

```javascript
var path = require('path')
var cooking = require('cooking')

cooking.set({
  use: 'vue',
  entry: './src/main.js',
  dist: './dist',
  template: './index.html',
  devServer: true,

  hash: true,
  clean: true,
  extractCSS: true,
  sourceMap: true,
  publicPath: '/dist/',
  assetsPath: 'static',
  extends: ['vue', 'lint']
})

cooking.add('resolve.alias', {
  'src': path.resolve(__dirname, '../src'),
  'assets': path.resolve(__dirname, '../src/assets'),
  'components': path.resolve(__dirname, '../src/components')
})

module.exports = cooking.resolve()
```

同时，如果不上测试的话，package.json 中的依赖可以清理下了
```json
{
  "name": "test-vue",
  "version": "0.0.0",
  "description": "A vue project.",
  "dependencies": {
  },
  "devDependencies": {
  }
}
```
