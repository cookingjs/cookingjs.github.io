# Methods
In webpack, loaders and plugins are frequently modified. But the fact that they only accept arrays as their values makes them hard to update or overwrite. So here some new methods are provided to manipulate them.
<!-- toc -->

## set(options: Object)
Use `set` to configure what are listed in [configuration](configuration.md). They will be merged with presets.
```javascript
var cooking = require('cooking')

cooking.set({
  entry: './src/app.js',
  devServer: true
})
```

## add(path: String, option: Any)
Use `add` to add (or overwrite) loaders or plugins. Case insensitive.
```javascript
cooking.add('loader.es6', {
  test: /\.es6$/,
  loaders: ['babel-loader']
})

// will be parsed to
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

To add a plugin
```javascript
// var webpack = require('webpack')
// this imports webpack from cooking, no need to install
cooking.add('plugin.Banner', new webpack.BannerPlugin(banner, options))

// will be parsed to
{
  plugins: [
   new webpack.BannerPlugin(banner, options)
  ]
}

```

other configurations can also be added or overwritten by `add`
```javascript
cooking.add('output.filename', '[name].bundle.js')

// will be parsed to
{
  output: {
    filename: [name].bundle.js
  }
}

```

## remove(path: String)
Use `remove` to remove presets
```javascript
// remove `{ test: /\.json$/, loaders: ['json-loader']}`
cooking.remove('loader.json')
```

preset loaders are
- loader.js
- loader.font
- loader.image
- loader.svg
- loader.html
- loader.css
- loader.json

preset plugins are
- plugin.occurenceorder
- plugin.NoErrors
- plugin.Define
- plugin.UglifyJs
- plugin.ExtractText

## resolve()
User `resolve` to return the final webpack configuration. Loaders and plugins are stored as Object in cooking, and they will be converted to arrays after `resolve`.
```javascript
var config = cooking.resolve()

// at this point you can still modify the configuration, e.g. adding a suffix
config.resolve.extensions.push('.json')

module.exports = config
```

