# 一些问题

#### 用 Lint 是给出的提示是 Warn 而不是 Error？

ESLint 默认是触发 Error，但这将会打断 Webpack 的 build[^1]（至少我不希望如此），解决方法是去掉的 NoErrorsPlugin，然而这样又不能保证构建出错不自动中断；另一种方法是把 ESLint 触发 Error 改成 Warn。
```javascript
eslint: {
  emitWarning: true
}
```

### loader 能不能用简写？
如果需要增加新 loader, 或者使用自己的 webpack 配置, 请将 loader 改成完整名字而不是简写。因为用户本地安装了 vue 依赖, 查找路径的顺序[^2]问题会把用户的 vue 模块当作 vue-loader 使用导致报错。[^3]

```javascript
// 应该使用
cooking.add('loader.vue', {
  test: /\.vue$/,
  loaders: ['vue-loader']
})

// 而不是
cooking.add('loader.vue', {
  test: /\.vue$/,
  loaders: ['vue']
})
```

### 如何使用不同版本的依赖？
在你本地安装你需要的依赖即可，优先读取项目目录中的依赖。

### 如果我需要用 Webpack 里的其它插件，是否需要在本地安装 Webpack 依赖？
不需要。依旧是使用 `require('webpack')` 的方式就可以访问到 cooking 里的 Webpack 依赖，除非你想使用其它版本的 Webpack 才需要安装。例如
```javascript
var webpack = require('webpack')
var cooking = require('cooking')

cooking.set({
  entry: './src/app.js'
})

cooking.add('plugin.banner', new webpack.BannerPlugin('/** comments **/'))
```
同时 cooking 里还内置了其它插件也可以直接 require 获取

- extract-text-webpack-plugin
- html-webpack-plugin



### 如何使用已经存在的 Webpack 配置文件？
拿 vue-cli 的生成的 Webpack 项目举例，如果你不需要使用 vue-cli 生成项目提供的 server 直接使用 cooking 内置的话，在 `build/webpack.dev.conf.js` 加入 `devServer: true` 后执行
```bash
$ cooking watch -c build/webpack.dev.conf.js
```

### Babel 和 ESLint 的配置文件
虽然提供 Babel 相关依赖，但是并没有给默认配置，需要在项目下面创建一个 .babelrc 和 .eslintrc 文件，内置的依赖可以配置成这样

.babelrc
```json
{
  "presets": ["es2015", "stage-0", "stage-2"],
  "plugins": ['transform-runtime']
}
```

.eslintrc[^4]
```javascript
{
  "plugins": ["vue"],
  "extends": ["elemefe"]
}
```


-------------
[^1]: https://github.com/MoOx/eslint-loader/issues/23

[^2]: cooking 增加了一下 node require 的路径规则，查找顺序先从用户目录查找依赖，再到 cooking 目录下查找。

[^3]: http://stackoverflow.com/questions/29883534/webpack-node-modules-css-index-js-didnt-return-a-function

[^4]: 参考 [cooking-eslint](https://github.com/cookingjs/cooking-lint) 提供的依赖，如果未提供，自己本地安装即可
