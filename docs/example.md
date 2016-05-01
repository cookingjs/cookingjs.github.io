# 一个 Vue 项目
来看看用 cooking 创建的一个 Vue 项目，支持 ES6、hotreload、ESLint 特性的项目结构是怎样的

```text
|-- src/
  |-- app.vue
  |-- entry.js
  |-- index.template.html
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
  template: './src/index.template.html',
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
  },
  "devDependencies": {
  }
}
```

零依赖，同时是直接通过 cooking 的脚手架生成的项目。也就是只需要两行命令，几秒就能启动一个支持热替换，构建时文件带 hash、sourceMap，并且 CSS 样式独立文件，还支持 lint 的项目。这就是 cooking 带来的好处。

