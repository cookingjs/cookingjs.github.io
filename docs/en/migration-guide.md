# Migration guide

In this guide we will migrate a project created by vue-cli.

## Preparation
Create cooking.conf.js, and add some configs
```javascript
var cooking = require('cooking')

cooking.set({

})

module.exports = cooking.resolve()
```

## entry
Just copy what is inside webpack entry
```javascript
{
  entry: {
    app: './src/main.js'
  }
}
```

## output
The default output path and publicPath are both `./dist`, so you can omit them if that's your case
```javascript
{
  publicPath: '/dist/',
  dist: './dist',
  assetsPath: 'static'
}
```

## loader
By default cooking provides loaders for `css`, `html`, `images` and `json`. They basically cover all loaders inside `build/webpack.base.conf.js`. You just need to add plugins for the additional vue-loader and eslint-loader
```javascript
{
  extends: ['vue', 'lint']
}
```

## resolve
You need to configure alias yourself. No default is provided
```javascript
{
  alias: {
    'src': path.resolve(__dirname, '../src'),
    'assets': path.resolve(__dirname, '../src/assets'),
    'components': path.resolve(__dirname, '../src/components')
  }
}
```

## dev server
cooking uses webpack's webpack-dev-server as its dev server, so you can use the default configuration. For more detail please refer to the [documentation](http://webpack.github.io/docs/webpack-dev-server.html)
```javascript
{
  devServer: true
}

// default configuration
{
  devServer: {
   // note that publicPath here will overwrite what you specified above. This is different from webpack's webpack-dev-server
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
Just specify extractCSS
```javascript
{
  extractCSS: true
}
```

## HtmlWebpackPlugin
For your template file, if no special configuring is needed, simply specify its path

```javascript
  template: './index.html'
```

If a template file has variables, it should be written as `<%= someVariable %>` (see [documentation](https://github.com/ampedandwired/html-webpack-plugin/blob/master/migration.md#templating-and-variables)). For example
```html
<title><%= htmlWebpackPlugin.options.title %></title>
```
Besides, due to [this problem](https://github.com/ampedandwired/html-webpack-plugin/issues/223), some more measures have to be taken to guarantee the variables being parsed correctly. For now we have 3 plans
*  Plan A (recommended): change the template's filename extension to `tpl`, e.g. rename `index.html` to `index.tpl`；
*  Plan B: exclude this template inside `loader` 
```javascript
cooking.add('loader.html', {
  test: /\.html$/,
  loader: 'html',
  exclude: /^index\.html$/
})
```
*  Plan C: use `underscore-template-loader` to handle this template
```javascript
template: {
  'index.html': {
    template: 'underscore-template!./index.html'
  }
}
```

## babel and eslint configs
Creating .babelrc and .eslintrc in your project directory is recommended

.babelrc
```json
{
  "presets": ["es2015", "stage-0", "stage-2"],
  "plugins": ["transform-runtime"],
  "comments": false
}
```

.eslintrc
```json
{
  "extends": ["elemefe"],
  "plugins": ["vue"]
}
```


## Final configuration
Finally add `use`, `hash`, `clean` and `sourceMap`, and you'll get a much simpler configuration that used to be made up of up to a hundred lines of configs across multiple files

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
  extends: ['vue', 'lint'],
  alias: {
    'src': path.resolve(__dirname, '../src'),
    'assets': path.resolve(__dirname, '../src/assets'),
    'components': path.resolve(__dirname, '../src/components')
  }
})

module.exports = cooking.resolve()
```

Meanwhile, if testing is unnecessary, the dependencies inside package.json can be purged
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
