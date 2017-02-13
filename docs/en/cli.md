# CLI
Aside from the basic commands like init/watch/build, cooking provides a set of extensible commands for managing plugins and generators.

<!-- toc -->

## Initiation

### `config`
Before we start, let's briefly configure cooking itself
```bash
# view configuration
$ cooking config

# configure option. Option will be wiped if value is omitted
$ cooking config <option> [value]
```
For now cooking supports
```javascript
{
  // default generator when running cooking init
  "template": "vue",

  // which mirror to use when running cooking update, init and import
  // taobao mirror is recommended for Chinese users. Default value is void
  "registry": "https://registry.npm.taobao.org",

  // if cooking checks updates automatically and display a hint when there is one
  "updateCheck": true,

  // generator will read what you assign here, frees you from configuring package.json every time
  "github": "",
  "author": ""
}
```

### `create <project-name> [generator-name]`
Creates a project and runs the generator
```bash
# create my-project and run vue generator
$ cooking create my-project vue
```

### `init [generator-name]`
```bash
# run the generator
# useful when you already have a project created
$ cooking init vue
```

## Development
### `watch`
Starts develop mode
```bash
$ cooking watch
```

- -c --config <configfile>

Specifies config file. Uses `cooking.conf.js` if omitted
```bash
$ cooking watch -c webpack.config.js
```

Accepts an array of config files separated by a comma
```bash
$ cooking watch -c cooking.desktop.js,cooking.mobile.js
```

### `build`
Starts production mode, and generates code ready for deploy
```bash
$ cooking build
```

- -c --config <configfile>

Specifies config file. Uses `cooking.conf.js` if omitted
```bash
$ cooking build -c webpack.config.js
```

Accepts an array of config files separated by a comma
```bash
$ cooking watch -c cooking.desktop.js,cooking.mobile.js
```

- -p --progress

Displays a building progress bar

- --no-color

Console outputs display no color

- --output-public-path

Specify publicPath. This will overwrite `publicPath` in your config file

```shell
cooking build --output-public-path xxx.cdn.com/
```

## Plugins

Remember to separate multiple plugins with a space

### `import`
Installs plugins[^1], commands and generators
```bash
# install a plugin
$ cooking import vue

# install a command. This will add 'cooking test' in the command list
$ cooking import test -c
```

- -t --template[^2]

Installs generators
```bash
$ cooking import vue -t
```

- -r --registry

Download specified mirror. This will overwrite config:registry
```bash
$ cooking import vue -r https://registry.npm.taobao.org
```

### `update`
Updates plugins and commands
```bash
# update a plugin
$ cooking update vue

# update a command
$ cooking update test -c
```

- -t -template
- -r --registry

Same as `import`


### `remove`

Removes plugins and commands
```bash
# remove a plugin
$ cooking remove vue

# remove a command
$ cooking remove test -c
```

- -t -template

Same as `import`


### `list`

View a list of installed commands, plugins and generators
```bash
$ cooking list
```

----------
[^1]: If a nonexistent plugin is referred to in the config file, e.g. `extends: ['vue']`, it will be automatically installed

[^2]: Using `-g --generator` can be confused with 'globally import', so here `-t --template` is used instead

