# RefineExport

## Usage

This gems adds an `export:` keyword parameter to `refine` to export the refined methods
into either the receiver (`export: true`) or a particular module (`export: MyMod`).

```ruby
using RefineExport

module Extension
  refine String, export: true do
    def twice
      self * 2
    end
  end
end

Extension.instance_methods # => [:twice] (because of export)

# May be used either:
using Extension
'foo'.twice # => 'foofoo'

# or the module may be included:
Integer.include Extension
21.twice # => 42
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'refine_export'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install refine_export

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marcandre/refine_export. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/marcandre/refine_export/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RefineExport project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/marcandre/refine_export/blob/master/CODE_OF_CONDUCT.md).
