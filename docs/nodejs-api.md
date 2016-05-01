# 方法
Webpack 的配置中经常会去改动的是 loaders 和 plugin，不过它们传入的是数组类型不方便修改或覆盖。所以这里还提供了新的方法给我们操作配置。
<!-- toc -->

## set(options: Object)
设置[基本配置](configuration.md)的方法，会与预配置合并。
```javascript
var cooking = require('cooking')

cooking.set({
  entry: './src/app.js',
  devServer: true
})
```

## add(path: String, option: *)
如果我们想增加（或是覆盖） loader 或者 plugin 就可以使用该方法。
```javascript
cooking.add('loader.es6', {
  test: /\.es6$/,
  loaders: ['babel-loader']
})

// 将会被翻译成
{
  module: {
    loaders: [
      {
        test: /\.es6$/,
        loaders: ['babel-loader']
      }
    ]
  }
}
```

如果是增加 plugin
```javascript
cooking.add('plugin.Banner', new webpack.BannerPlugin(banner, options))

// 将会被翻译成
{
  plugins: [
   new webpack.BannerPlugin(banner, options)
  ]
}

```

其它的配置也可以使用 add 增加（覆盖）
```javascript
cooking.add('output.filename', '[name].bundle.js')

// 将会被翻译成
{
  output: {
    filename: [name].bundle.js
  }
}

```

## remove(path: String)
移除预配置项
```javascript
// 将 `{ test: /\.json$/, loaders: ['json-loader']}` 删除
cooking.remove('loader.json')
```

默认设置的 loader 包含
- loader.js
- loader.assets
- loader.html
- loader.css
- loader.json

默认设置的 plugin 包含
- plugin.occurenceorder
- plugin.NoErrors
- plugin.Define
- plugin.UglifyJs
- plugin.ExtractText

## resolve()
返回最终的 Webpack 配置。loader 和 plugin 的配置在 cooking 里是以 Object 的形式存储的，resolve 会将其转换成数组
```javascript
var config = cooking.resolve()

// 还可以进一步去修改 Webpack 配置，例如增加一个后缀
config.resolve.extensions.push('.json')

module.exports = config
```

