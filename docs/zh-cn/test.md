# 如何写测试

提供的 [cooking-test-command](https://github.com/cookingjs/cooking-test-command) 可以方便的让我们使用任何测试工具。例如 cooking 提供的 [cooking-karma](https://github.com/cookingjs/cooking-karma) 插件会帮你安装 karma 的相关依赖，接着就可以像正常使用 karma 的方式写测试了。

## 快速上手
cooking 的 vue 脚手架已经提供了创建 test 相关配置的选项，升级到 ^0.5.0 即可体验。
```shell
# 确保已经安装过了 karma 和 test 指令
cooking import karma
cooking import test -c

# 使用 ^0.5.0 的脚手架
cooking init vue
cooking test
```

## 安装
安装成功后执行 `cooking` 会看到命令行里多了一条 `test` 指令。
```shell
cooking import test -c
```

## 使用
test 指令的作用只是配置了运行环境，让测试工具可以使用到 cooking 提供的 webpack 配置，就像 `cross-env` 一样，后面接的参数就是测试工具的指令。
```shell
cooking test [...]
```

## 例子
这里以 karma 的使用举例。首先安装 `cooking-karma` 插件，当然内置的依赖并不一定满足你的所有需求，没有提供的需要你自己手动安装。

### 写 karma 测试
如果你熟悉 karma 的命令行使用方式的话，会知道可以通过执行 init 的指令创建配置文件，当然你可以通过 cooking 的脚手架提供的配置文件。
```shell
cooking test karma init
```

### 运行测试

```shell
cooking test karma start --single-run
```

同样的道理，你可以自己安装 tap、ava 等测试工具，用同样的方式使用。同样也可以把它们封装成 cooking 的插件，就只需像 cooking-karma 一样安装一次了。
