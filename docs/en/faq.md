# FAQ

#### Why does Lint report Warn instead of Error?

ESLint by default reports Error, but this breaks webpack's build[^1] (in most cases this is undesired). A solution is removing NoErrorsPlugin, but this way webpack does not break even when an error occurs. We use another solution that changes what ESLint reports from Error to Warn
```javascript
eslint: {
  emitWarning: true
}
```

#### Can I use a shorthand for a loader?
If you need to add a new loader or use your webpack configuration, please use the loader's full name instead of a shorthand. Because if the user has vue installed locally, due to the path lookup rule[^2], cooking takes vue module as vue-loader which lead to an error[^3].

```javascript
// use
cooking.add('loader.vue', {
  test: /\.vue$/,
  loaders: ['vue-loader']
})

// instead of
cooking.add('loader.vue', {
  test: /\.vue$/,
  loaders: ['vue']
})
```

#### How can I use dependencies of different versions across projects?
Simply install what you need locally. Local dependencies have a higher priority than the global one.

#### If I need some other plugins of webpack, do I have to install webpack dependencies locally?
Not if you need another version of webpack. By `require('webpack')` you are granted access to webpack dependencies inside of cooking. For example
```javascript
var webpack = require('webpack')
var cooking = require('cooking')

cooking.set({
  entry: './src/app.js'
})

cooking.add('plugin.banner', new webpack.BannerPlugin('/** comments **/'))
```
Meanwhile cooking has some other built-in plugins you can use by requiring them

- extract-text-webpack-plugin
- html-webpack-plugin



#### How can I use an existing webpack config?
Take a vue-cli generated project for example. If you prefer the server that comes within cooking over the one provided by vue-cli, you can add `devServer: true` behind `build/webpack.dev.conf.js` and run
```bash
$ cooking watch -c build/webpack.dev.conf.js
```

#### Babel and ESLint configurations
Babel-related dependencies are provided without default configurations, so you need to create .babelrc and .eslintrc. Inside them you can configure

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

#### Reporting module not found when running a command?
Please check if `node_modules` directory exists inside your user's root directory, and delete it if there is. For macOS users, the path is `~/node_modules`.

-------------
[^1]: https://github.com/MoOx/eslint-loader/issues/23

[^2]: cooking has added some path lookup rules for node require. It starts from user root path, and if nothing is found, it goes to cooking directory

[^3]: http://stackoverflow.com/questions/29883534/webpack-node-modules-css-index-js-didnt-return-a-function

[^4]: if a dependency is not provided by [cooking-eslint](https://github.com/cookingjs/cooking-lint), you can install it locally yourself
