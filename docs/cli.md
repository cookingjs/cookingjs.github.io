# CLI
提供了基本 init/watch/build 的同时还提供了一组管理插件和脚手架的指令。而且指令也是可扩展的。

<!-- toc -->

## `config`
配置一些信息能方便的使用 cooking
```bash
# 查看配置
$ cooking config

# 配置属性，value 不填则清空
$ cooking config <option> [value]
```
目前支持的配置如下
```javascript
{
  // 执行 cooking init 默认使用的脚手架
  "template": "vue",

  // update, init, import 时的镜像，国内用户访问慢的可配置成 taobao 镜像，默认为空
  "registry": "https://registry.npm.taobao.org",

  // 是否自动检查更新，cooking 版本升级会有提示
  "updateCheck": true,

  // 脚手架会读取配置，省去一次次配置 package.json
  "github": "",
  "author": ""
}
```

## `create <project-name> [generator-name]`
创建项目目录并执行脚手架
```bash
# 创建一个 my-project 目录并运行 vue 的脚手架
$ cooking my-project vue
```

## `init [generator-name]`
```bash
# 运行脚手架
$ cooking init vue
```

## `watch`
启动开发（调试）模式
```bash
$ cooking watch
```

- -c --config <configfile>

默认读取 `cooking.conf.js` 配置也指定配置文件
```bash
$ cooking watch -c webpack.config.js
```

## `build`
生产模式，生成最终的部署代码
```bash
$ cooking build
```

- -c --config <configfile>

默认读取 `cooking.conf.js` 配置也指定配置文件
```bash
$ cooking build -c webpack.config.js
```

## `import`
安装插件[^1]、指令
```bash
# 安装插件
$ cooking import vue

# 安装指令，指令列表中会多一个 cooking lint
$ cooking import lint-cli
```

- -t --template[^2]

安装脚手架
```bash
$ cooking import vue -t
```

- -r --registry

指定下载镜像，如果配置了 config:registry 会使用配置中的镜像
```bash
$ cooking import vue -r https://registry.npm.taobao.org
```

## `update`
更新插件、指令
```bash
# 更新插件
$ cooking update vue

# 更新指令
$ cooking update lint-cli
```

- -t -template
- -r --registry

同 `import`


## `remove`

卸载插件、指令
```bash
# 卸载插件
$ cooking remove vue

# 卸载指令
$ cooking remove lint-cli
```

- -t -template

同 `import`


## `list`

查看安装的指令、插件、脚手架列表
```bash
$ cooking list
```

----------
[^1]: 在配置文件中设置了 `extends: ['vue']` 且插件不存在将会自动执行安装操作

[^2]: 命名为 `-g --generator` 的话容易有歧义，`cooking import vue -g` 会被误解为全局安装

