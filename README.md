# RequestStoreRails::Sidekiq
## Problem

[`request_store_rails`](https://github.com/ElMassimo/request_store_rails) is the gem which allows you to have request-local variables stored in your app logic.
It is integrated to Rails so that every time you receive a request, new `RequestLocals` context is created.

When you are using Sidekiq on your Rails project, however, such context refreshing is not available as the Rails integration is achieved as a Rack middleware.
Ideally, you'd want to have your `RequestLocals` context refreshed on each invocation of Sidekiq job.

This gem exactly achieve this purpose.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'request_store_rails-sidekiq'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install request_store_rails-sidekiq

## Usage

If you're using Rails, you'll have RequestLocals working on Sidekiq out of the box.
The `Thread.current[:request_id]` will be set to the job's id (the `jid`).

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Yuki-Inoue/request_store_rails-sidekiq.
