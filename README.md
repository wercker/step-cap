# cap

A wercker step to execute a `capistrano` task. The step has support for multiple stages.

You should have capistrano and bundler installed.

More information:
- https://github.com/capistrano/capistrano

[![wercker status](https://app.wercker.com/status/85c72d233dc01f98af1d3413b311d3ce/m "wercker status")](https://app.wercker.com/project/bykey/85c72d233dc01f98af1d3413b311d3ce)

# What's new

- Update readme

# Options

* `tasks` (optional, default: `deploy`) The tasks which will be run.
* `stage` (optional) The stage which will be used for the deployment. Requires [multistage extension](https://github.com/capistrano/capistrano/wiki/2.x-Multistage-Extension).
* `command` (optional, default: `bundle exec cap`) command to run.

# Example

``` yaml
deploy:
  steps:
    - cap
```

# Recommended Capfile

The normal recommended way to use Capistrano is to use a scm and make the servers download the files through the scm. This however is not recommended when using wercker, because some steps change certain files (ie. concatenating and minifying). Also it might not be possible because of strict firewall rules or installed applications. And finally it is not possible to deploy a certain build. The solution is to use the output of your build process and to not use a scm in your capistrano script. We recommend using the following settings:

```ruby
set :repository, "."
set :scm, :none
set :deploy_via, :copy
```

Note however that this will also apply to your local repository, so another recommendation is to use [multistage extension](https://github.com/capistrano/capistrano/wiki/2.x-Multistage-Extension) and use a seperate stage for wercker deployment.

# License

The MIT License (MIT)

# Changelog

## 0.0.5

- Ability overwrite cap command, added `command` option

## 0.0.4

- Remove PATH support, use cwd instead

## 0.0.3

- Update readme

## 0.0.2

- Initial release
