# strftime

It's pronounced "strftime", not "strftime".

With strftime you'll have descriptions of time format directives at your fingertips in Ruby.

`Strftime::Directive.all` contains an array of these directive objects
holding a key, description and example.

Just use `Strftime::Directives['%M']` to get a description and example, or use the shorthand method `strfd '%M'`

    Strftime::Directives['%M'].description #=> 'Minute of the hour'

This might be useful for you, or for users of a system which are able to specify string formats for dates and times.

## How is that useful?

You want more? You got it. With strftime you'll have `strfd` available to your in your ruby and your terminal. What's that?

By running `strfd "June 14 2011"` you'll get a list of directives that you can use to format a time and get what you want.

Other projects try to give you information about time formatting by showing you all the options upfront and allowing you to decide. strftime goes the opposite way and tries to take your desired outcome and give you want you need to format it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'strftime'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install strftime

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/strftime. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Strftime project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/saturnflyer/strftime/blob/master/CODE_OF_CONDUCT.md).
