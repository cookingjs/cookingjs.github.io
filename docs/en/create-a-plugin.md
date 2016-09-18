# How to write a plugin

Essentially cooking's plugins provide extended configurations and dependencies. Extended configurations by different plugins should be **independent and not interfering with each other**. Plugins inside `extends` are executed one by one by their appearing order, and the extended dependencies they provide will be used in runtime.

The main part is as follows

```javascript
/**
 * @param  {object} cooking - provides add, remove _userConfig and config
 * @param  {*} options - customized parameters supported
 */
module.exports = function (cooking, options) {
  // do it
};
```

## Regulations
- Extended configurations by different plugins should be **independent and not interfering with each other**
- Name your plugin ** cooking-* ** [^1]

## Parameters
### `cooking`
`add` and `remove` are the same as what we [introduced before](nodejs-api.md). `config` specifies the current webpack configuration, while `_userConfig` gets the configuration of a user. For a vue plugin, you can write
```javascript
var cssLoader = require('./css-loader')

/**
 * @param  {object} cooking - provides add, remove and config
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

### Options
For custom configuring options, please refer to [cooking-postcss](https://github.com/cookingjs/cooking-postcss)

## Dependencies
Include all dependencies inside `dependencies` of package.json 
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


## Scaffold a plugin
You can initiate a plugin using our scaffold
```bash
$ cooking init plugin
```

-------------
[^1]: cooking automatically matches plugins prefixed with `cooking-`
