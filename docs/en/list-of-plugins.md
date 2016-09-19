# Plugins

To update a plugin
```shell
cooking update vue
```

or

```shell
cooking remove vue && cooking import vue
```

By using [extends](configuration.html#extends) we can import additional configurations and dependencies. Provided plugins are:

- [vue](https://github.com/cookingjs/cooking-vue) - vue-related configurations
- [react](https://github.com/cookingjs/cooking-react) - react-related configurations

## Lint
- [lint](https://github.com/cookingjs/cooking-lint) - use ESLint

## CSS
- [sass](https://github.com/cookingjs/cooking-sass) - sass configuration
- [less](https://github.com/webjyh/cooking-less) - less configuration by [webjyh](https://github.com/webjyh)
- [postcss](https://github.com/cookingjs/cooking-postcss)(deprecated in 1.0) - postcss-loader with built-in cssnext
- [saladcss](https://github.com/cookingjs/cooking-saladcss)(deprecated in 1.0) - a more friendly CSS preprocessor plugin [postcss-salad](http://elemefe.github.io/postcss-salad)

## Test
- [karma](https://github.com/cookingjs/cooking-karma) - karma-related dependencies

For more plugins, please refer to https://github.com/cookingjs. Developing new plugins is highly encouraged.