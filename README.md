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

Copyright (c) 2013 wercker

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Changelog

## 0.0.3

- Update readme

## 0.0.2

- Initial release
