# Blorgh
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'blorgh'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install blorgh
```

Add this line to your application's application.rb:

```ruby
require 'rails/all'
require 'blorgh/mini_profiler'
config.middleware.use Blorgh::MiniProfiler
```

```ruby
config.middleware.use Blorgh::MiniProfiler
```

Add this line to your application's routes.rb:

```ruby
mount Blorgh::Engine, at: "/blog"
```
## Contributing
[Liu XiaoDao](https://github.com/Liu-XiaoDao)

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
