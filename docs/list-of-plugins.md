# 插件

升级插件的方式
```shell
cooking remove vue
cooking import vue
```

通过 [extends](configuration.html#extends) 我们可以引入额外的配置和依赖，目前提供的插件有：

- [vue](https://github.com/cookingjs/cooking-vue) - 提供 vue 相关配置
- [react](https://github.com/cookingjs/cooking-react) - 提供 react 相关配置

## Lint 相关
- [lint](https://github.com/cookingjs/cooking-lint) - 使用 ESLint

## CSS 相关
- [sass](https://github.com/cookingjs/cooking-sass) - sass 配置
- [less](https://github.com/webjyh/cooking-less) - less 配置 by [webjyh](https://github.com/webjyh)
- [postcss](https://github.com/cookingjs/cooking-postcss) - postcss-loader, 内置 cssnext 等
- [saladcss](https://github.com/cookingjs/cooking-saladcss) - 更好用的 CSS 预处理插件 [postcss-salad](http://elemefe.github.io/postcss-salad)

## 测试相关
- [karma](https://github.com/cookingjs/cooking-karma) - karma 相关依赖

更多插件可以在 https://github.com/cookingjs 找到，同时欢迎你来开发新的插件。