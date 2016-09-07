# 一个 Vue 项目
来看看用 cooking 创建的一个 Vue 项目，支持 ES6、hotreload、ESLint 特性的项目结构是怎样的

```text
|-- src/
  |-- app.vue
  |-- entry.js
  |-- index.tpl
|-- .babelrc
|-- .eslintrc
|-- cooking.conf.js
|-- package.json
```

所需要配置
```javascript
var cooking = require('cooking')

cooking.set({
  entry: './src/entry.js',
  dist: './dist',
  template: './src/index.tpl',
  devServer: true,

  // Production
  clean: true,
  hash: true,
  sourceMap: true,
  extractCSS: true,
  extends: ['vue', 'lint']
})

module.exports = cooking.resolve()
```

package.json 的内容
```json
{
  "name": "test-vue",
  "version": "0.0.0",
  "description": "A vue project.",
  "dependencies": {
    "vue": "^1.0.0"
  },
  "devDependencies": {
  }
}
```

零开发依赖，同时是直接通过 cooking 的脚手架生成的项目。也就是只需要两行命令，几秒就能启动一个支持热替换，构建时文件带 hash、sourceMap，并且 CSS 样式独立文件，还支持 lint 的项目。这就是 cooking 带来的好处。

# 依赖管理
当然，如果你担心别人使用你的项目也需要全局安装 `cooking-cli` 并且无法精确的控制依赖的话，你也可以在项目里安装 `cooking`。
那么 package.json 大致就是：
```json
{
  "name": "test-vue",
  "version": "0.0.0",
  "description": "A vue project.",
  "dependencies": {
    "vue": "^1.0.0"
  },
  "devDependencies": {
    "cooking": "^1.0.0",
    "babel-core": "^6.0.0",
    "babel-loader": "^6.0.0",
    "css-loader": "^0.24.0",
    "extract-text-webpack-plugin": "^1.0.0 || ^2.0.0-beta",
    "file-loader": "^0.9.0",
    "html-loader": "^0.4.3",
    "html-webpack-plugin": "^2.9.0",
    "json-loader": "^0.5.4",
    "style-loader": "^0.13.1",
    "url-loader": "^0.5.7",
    "webpack": "^1.12.0 || ^2.1.0-beta",
    "webpack-dev-server": "^1.14.0 || ^2.1.0-beta",
    "postcss": "^5.1.0",
    "postcss-loader": "^0.11.1"
  }
}
```


