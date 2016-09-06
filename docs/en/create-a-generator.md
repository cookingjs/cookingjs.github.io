# 如何写脚手架
内置的脚手架工具是 [slush](https://github.com/slushjs/slush)，相比 [yeoman](http://yeoman.io/authoring/index.html) 更轻量级且写起来也会很熟悉（用 Gulp 写脚手架[^1]）。

无论你会不会用 Gulp，可以直接通过提供的脚手架生成一个脚手架，基本上改改配置就能写完一个脚手架
```bash
$ cooking init generator
```

## 规定
- 脚手架项目用** slush-cooking-* **的命名
- 已经提供了 [Gulp 等相关依赖](https://github.com/cookingjs/generator-package-cooking)，发布时不需要带上， 所以如果是要测试的话，请自行安装 Gulp 等相关依赖 为 `devDependencies`

------------
[^1]: 不清楚 generator 翻译成什么好，直接叫 scaffolding（脚手架） 了。
