<!-- toc -->

## What is cooking
cooking is a front-end build tool based on webpack with yet easier configuring and preset common configurations. With its CLI tool, you can manage and install your devDependencies globally. And it comes with generators that help scaffold a Vue-based or React-based project with efficiency.

## Quick start
### cooking-cli
> A globally installed CLI tool based on webpack 2. Installs project dependencies globally, thus frees you from installing them in each and every project. Provides generators, plugin management, etc.

**Make sure you have `NPM 3+`, `Node 4+`, `Python 2.7+` installed**

Step 1: install cooking-cli
```bash
npm i cooking-cli -g
```

Step 2: create a project
```bash
cooking create my-project vue
```

Step 3: start developing
```bash
cd my-project && cooking watch
```

Follow-ups: bundling, testing, etc.
```bash
cooking build # or cooking run test
```

## cooking
> The core of cooking-cli. Provides simplified webpack configurations and build/watch commands. No dependencies. Compatible with webpack 1 and 2.


Step 1: install cooking
```bash
npm i cooking -D
```

Step 2: install dependencies
```bash
# webpack 1
npm i babel-core babel-loader css-loader file-loader postcss postcss-loader\
 html-loader html-webpack-plugin json-loader style-loader url-loader\
 webpack@1 webpack-dev-server@1 extract-text-webpack-plugin@1 -D

# webpack 2
npm i babel-core babel-loader css-loader file-loader postcss postcss-loader\
 html-loader html-webpack-plugin json-loader style-loader url-loader\
 webpack webpack-dev-server extract-text-webpack-plugin -D
```

Step 3: configure cooking

cooking.conf.js
```javascript
var cooking = require('cooking')

cooking.set({
  entry: './src/index.js',
  dist: './dist'
})

module.exports = cooking.resolve()
```

Step 4: run
```bash
# develop
node_modules/.bin/cooking watch

# bundle
node_modules/.bin/cooking build

# or use webpack commands
webpack --config cooking.conf.js

# and if cooking-cli is installed globally
cooking watch # or build
```
