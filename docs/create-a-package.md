# 如何写依赖包

设置依赖包的目的是为了避免每次都需要安装所用框架及其相关配套工具，所以只需要配置下 package.json 文件中的 dependencies 即可。cooking 在监测到使用了 use 字段会下载对应依赖包的相关依赖。用户也可以在本地项目安装指定的版本，优先读取用户本地的依赖。

package.json
```json
"dependencies": {
  "vue": "^1.0.21",
  "vue-resource": "^0.7.0",
  "vue-router": "^0.7.13",
  "vuex": "^0.6.3"
}
```

参考 [vue](https://github.com/cookingjs/cooking-package-vue)
