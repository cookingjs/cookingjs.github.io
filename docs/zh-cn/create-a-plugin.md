# 如何写插件

cooking 的插件本质上是提供扩展配置和依赖。不同插件扩展的配置应该是**独立的，互不干扰**。配置在 `extends` 内的插件会按照从左往右的顺序依次执行装配所提供的配置；在运行时，会去使用插件提供的依赖。

主体部分如下

```javascript
/**
 * @param  {object} cooking - 该参数提供 add, remove _userConfig 和 config
 * @param  {*} options - 支持自定义参数
 */
module.exports = function (cooking, options) {
  // do it
};
```

## 规定
- 不同插件扩展的配置应该是**独立的，互不干扰**
- 插件项目用** cooking-* ** [^1]的命名

## 参数
### `cooking`
提供的 add 与 remove 与[之前介绍](nodejs-api.md)的一致，config 当前的 webpack 配置内容，而 _userConfig 可以获取用户配置的内容。例如一个 vue 插件的主要代码
```javascript
var cssLoader = require('./css-loader')

/**
 * @param  {object} cooking - provide add, remove, config method
 * @param  {object} [options]
 */
module.exports = function (cooking) {
  var SOURCE_MAP = cooking.config.sourceMap

  // add loader
  cooking.add('loader.vue', {
    test: /\.vue$/,
    loaders: ['vue-loader']
  })

  // add extension
  cooking.config.resolve.extensions.push('.vue')

  // add vue config
  if (process.env.NODE_ENV === 'production') {
    cooking.config.vue = {
      loaders: cssLoader({
        sourceMap: SOURCE_MAP ? '#source-map' : false,
        extract: !!cooking.config.extractCSS
      })
    }
  } else {
    cooking.config.vue = {
      loaders: cssLoader()
    }
  }
}
```

### options
自定义配置参数，参考 [cooking-postcss](https://github.com/cookingjs/cooking-postcss)

## 依赖
所需依赖配置在 package.json 的 `dependencies` 内
```json
{
  "dependencies": {
    "vue": "^1.0.21",
    "vue-hot-reload-api": "^1.3.2",
    "vue-html-loader": "^1.2.2",
    "vue-loader": "^8.2.3",
    "vue-router": "^0.7.13",
    "vue-style-loader": "^1.0.0",
    "vuex": "^0.6.3"
  }
}
```


## 生成插件项目
我们提供了写插件的脚手架，可以直接初始化一个插件项目
```bash
$ cooking init plugin
```

-------------
[^1]: cooking 搜索插件时会自动匹配前缀为 cooking- 的模块
