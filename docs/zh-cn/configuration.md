
# 配置参数
cooking 包装了一些 webpack 配置项，所提供的配置参数满足多数项目的基本需求。1.0 表示 cooking@1.0.0 才有。

<!-- toc -->

## entry
与 webpack 的 [entry](http://webpack.github.io/docs/configuration.html#entry) 一致，入口文件。接受 String|Array|Object 类型
```javascript
// 单个入口文件
{
  entry: './src/index.js'
}

// 多入口文件但只打包成一个文件
{
  entry: ['./src/pageA.js', './src/pageB.js']
}

// 多入口文件，且分别打包, 最终生成 page1.js 和 page2.js 文件
{
  entry: {
    page1: './page1',
    page2: ['./entry1', './entry2']
  }
}
```

## dist
同 [output.path](http://webpack.github.io/docs/configuration.html#output-path) 项目输出路径，所不同的是这里填**相对路径**，最终打包后的文件都将输出到该目录里
```javascript
{
  dist: './dist'
}
```

## template
HTML 模板文件，使用 [html-webpack-plugin](https://github.com/ampedandwired/html-webpack-plugin) 生成。接受 Boolean|String|Object 类型
```javascript
  // 自动生成一个 index.html 文件
{
  template: true
}

// 指定模板文件相对路径，生成 index.html 文件
{
  template: './src/index.tpl'
}

// 多页面指定模板文件相对路径
{
  template: {
    'index.html': './src/index.tpl',
    'admin.html': './src/admin.tpl'
  }
}

// 需要使用 html-webpack-plugin 额外的参数
{
  template: {
    'admin.html': {
      filename: 'test.html', // 不指定默认使用键名
      chunks: ['admin', 'vendor'], // 不同页面使用不同的 chunk
      template: 'src/assets/test.tpl',
    },
    'home.html': {
      template: 'src/assets/home.tpl',
      chunks: ['home', 'vendor']
    }
  }
}

// 支持传入数组
{
  template: [
    {
      filename: 'admin.html',
      template: 'src/assets/admin.tpl',
      chunks: ['admin', 'vendor']
    },
    {
      filename: 'index.html',
      template: 'src/assets/home.tpl',
      chunks: ['home', 'vendor']
    }
  ]
}
```

## devServer
内置了一个 [webpack-dev-server](http://webpack.github.io/docs/webpack-dev-server.html) 方便进行 Web App 开发。配置参数与其基本一致。不同 webpack 的 API 版本略有差异。
```javascript
// 开启默认配置的 devServer，浏览器访问 http://localhost:8080
{
  devServer: true
}

// 自定义配置，以下为默认配置
{
  devServer: {
    // 是否启用
    enable: true,

    // 输出文件目录的 URL 路径，注意这里的配置会覆盖下面的 publicPath
    publicPath: '/',

    // 热替换
    hot: true,

    // 提取 CSS
    extractCSS: false,

    // 显示日志信息在页面上
    log: true,

    port: 8080,
    hostname: 'localhost',
    protocol: 'http:',

    // HTML5 history API
    historyApiFallback: true,

    // 控制台输出的信息
    stats: 'errors-only',
    noInfo: true,
    quiet: false,
    lazy: false
  }
}

```

## publicPath
同 [output.publicPath](http://webpack.github.io/docs/configuration.html#output-publicpath)。默认为 `/dist/`[^1]。
```javascript
{
  publicPath: '/dist/'
}
```

## assetsPath
图片、字体文件将被归类为资源文件，如果想把它们输出到相对于 `dist` 的子目录，配置其为 `dist` 的相对路径

```javascript
{
  assetsPath: 'static'
}
```


## urlLoaderLimit
图片、字体等资源文件小于多少时（单位 Byte）内嵌在 JS 或 CSS 中，默认为 10000
```javascript
{
  urlLoaderLimit: 10000
}
```


## clean
每次构建时清理掉之前的输出目录，默认 false
```javascript
{
  clean: false
}
```

## hash
输出文件名是否带 7 位的长度 hash 值，默认 false
```javascript
{
  hash: false
}
```

## sourceMap
构建后的文件带 sourceMap，默认 false
```javascript
{
  sourceMap: false
}
```

## format
可指定模块的输出类型。接受 amd|cjs|umd|var，其中 cjs 会被翻译成 webpack 的 commonjs2
```javascript
{
  format: 'var'
}
```

## moduleName
webpack 的 output.library
```javascript
{
  moduleName: ''
}
```

## chunk
webpack 的 [chunk](http://webpack.github.io/docs/list-of-plugins.html#commonschunkplugin) 配置的简化。接受 String|Object。可以把公共的代码部分提取出去，默认为空
```javascript
{
  entry: {
    app: './src/entry.js',
    vendor: ['vue', 'vue-router']
  },

  chunk: 'vendor'
}

// 设置为 true，等价于 https://github.com/vuejs-templates/webpack/blob/dist/template/build/webpack.prod.conf.js#L62-L82
{
  entry: './src/entry.js',
  chunk: true
}

// 或者传入数组
{
  entry: {
    app: './src/entry.js',
    vendor: ['vue', 'vue-router']
  },

  chunk: ['vendor', 'manifest']
}

// 如果需要 CommonsChunkPlugin 的其它配置
{
  chunk: {
    'chunk-vendor': {
      name: 'commons', // 不指定默认使用键名
      // (common chunk name)

      filename: 'commons.js', // 不指定默认根据键名生成（生产模式下带 hash）
      // (filename of the common chunk)

      // minChunks: 3,
      // (modules must be shared among at least 3 entries)

      // chunks: ['pageA', 'pageB'],
      // (only use these entries)
    }
  }
}
```

##  extractCSS
将 CSS 提取出成单独的文件。接受 Boolean|String，默认值为 `[name].[contenthash:7].css`

```javascript
// 为 true 将提取 CSS 文件并使用默认名字
{
  extractCSS: true
}

// 自定义文件名
{
  extractCSS: 'style.css'
}
```

## extends
cooking 默认只提供了 Babel 和 基本 loader，如果我们想开发 vue 项目并且构建前自动 lint 那么就要使用 cooking 的扩展配置和依赖的功能。例如下方将引入 [cooking-vue](https://github.com/cookingjs/cooking-vue) 和 [cooking-lint](https://github.com/cookingjs/cooking-lint) 插件（如果本地未安装会自动下载）。vue 插件做的事是配置 vue-loader；lint 插件会提供 eslint，几个标准的 eslint-config，并配置 eslint-loader。

```javascript
{
  extends: ['vue', 'lint']
}
```

如果插件是支持自定义参数的话，可以传入 Object 类型。例如 postcss 插件支持设置参数[^2]

```javascript
{
  extends: {
    vue: true,
    postcss: {
      cssnext: true
    }
  }
}
```

支持指定插件的版本
```javascript
{
  extends: ['vue@0.1.4']
}
```


## alias (1.0)
配置路径别名，通 webpack 的 resolve.alias
```javascript
{
  alias: {
    'src': require('path').join(__dirname, './src')
  }
}
```

## externals (1.0)
webpack 的 externals
```javascript
{
  externals: {
    'vue': 'vue'
  }
}
```

## postcss (1.0)
配置 postcss
```javascript
{
  postcss: [
    require('postcss-cssnext'),
    require('postcss-px2rem')
  ]
}

// 接受函数
{
  postcss: function(webpack) {
    return [
      require('postcss-import')({
        features: {
          partialImport: {
            addDependencyTo: webapck
          }
        }
      })
    ]
  }
}
```

## minimize (1.0)
指定是否压缩 js 或者 css，生产环境下默认为 true
```javascript
{
  minimize: false
}

// 接受传入对象
{
  minimize: {
    js: true,
    css: true
  }
}
```

-------------

[^1]: 多数情况下我们会指定一个目录例如`fe.project`为部署目录，输出文件会拷贝到该目录下。如果部署 `fe.project` 目录，域名指向 `fe.project/dist/index.html` 文件，那么 `app.js` 相对于域名的路径就变成了 `/dist/app.js`，所以配置 **publicPath** 的作用就在于此。同时也可以把它配置成一个 CDN 路径。如果我们把 `dist` 当作部署目录，域名指向 `dist/index.html` 文件，那么 `app.js` 的路径就是 `/app.js`，把 publicPath 设置成 `/` 即可。
[^2]: 更多设置项参考 [cooking-postcss](https://github.com/cookingjs/cooking-postcss#readme) 插件文档

