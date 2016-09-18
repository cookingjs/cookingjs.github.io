# How to write a generator 
We use [slush](https://github.com/slushjs/slush) as the built-in generator tool. It is lighter than [yeoman](http://yeoman.io/authoring/index.html) and feels familiar if you know how to write a generator with Gulp.

But don't worry if you have never used Gulp. You can always write a generator with the provided boilerplate, and all you have to do is modifying some parameters.
```bash
$ cooking init generator
```

## Regulations
- Name your generator project ** slush-cooking-* **
- [Gulp-related dependencies](https://github.com/cookingjs/generator-package-cooking) are provided, so don't register them in `dependencies` when publishing. If you need to run tests, please install Gulp-related dependencies as `devDependencies`
