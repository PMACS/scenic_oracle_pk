# ScenicOraclePk

Add a primary key to your Scenic-generated database views. Tested in Oracle, may work elsewhere, too.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scenic_oracle_pk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scenic_oracle_pk

## Usage

Within your migration's `change` method, either by itself, or directly after a `create_view` or `update_view` directive, you may add this line:

```rb
create_pk_for_view(:view_name, :column_name)
```

The `column_name` argument  is optional, and defaults to `:id`.

Calling this method will add a primary key to your database view that Rails can interrogate and use to inform your ActiveRecord-based model for that view. This means that you won't need to use the `self.primary_key = :foo` trick that is usually required when a model uses a database view as its data source.

If you need to remove this primary key (say, in a `#down` migration method), you may use the inverse:

```rb
remove_pk_for_view(:view_name, :column_name)
```

Both of these methods are reversible.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/walterdavis/scenic_oracle_pk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ScenicOraclePk project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/walterdavis/scenic_oracle_pk/blob/master/CODE_OF_CONDUCT.md).
