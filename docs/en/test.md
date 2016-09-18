# How to write a test

[cooking-test-command](https://github.com/cookingjs/cooking-test-command) enables you to use any testing tool conveniently. For example, cooking provides [cooking-karma](https://github.com/cookingjs/cooking-karma) that installs karma-related dependencies for you, and then you can write tests just the way you use karma.

## Quick start
The vue generator of cooking already provides options for creating tests. Make sure you have a ^0.5.0 version installed
```shell
# install karma and test commands
cooking import karma
cooking import test -c

# use ^0.5.0 generator
cooking init vue
cooking test
```

## Install
When the installation finishes, you can see an additional `test` command when you run `cooking`
```shell
cooking import test -c
```

## Usage
What `test` does is configuring the runtime so that testing tools have access to webpack configs provided by cooking, just like `cross-env`. The following parameters are commands for testing tools
```shell
cooking test [...]
```

## Example
Take karma for example. Install `cooking-karma` plugin first. The built-in dependencies may not meet all your needs, but you can manually install whatever is not provided.

### Write karma tests
If you are familiar with karma CLI, you'll know that by running the `init` command you can create a config file. And of course you can use the config file provided by cooking generator if you prefer
```shell
cooking test karma init
```

### Run tests

```shell
cooking test karma start --single-run
```

Similarly, you can use other testing tools like tap and ava. You can even take this one step further by encapsulating them into a cooking plugin, in which way you can install them only once just like what we did with cooking-karma.
