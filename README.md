# Blogster

Welcome to Blogster!


## Installation

Install it yourself as:

    $ gem install blogster

## Usage

Creating a new app with a name `app_name`.

    $ blogster new app_name

This will create a new skeleton for our new application.
Including styles and layouts.

After you enter the new app.

    $ cd app_name

You can generate posts with

    $ blogster generate Post Vim-Usage

And then you can run the project with

    $ blogster run

Bear in mind that in order to use `run` or `generate`, you have
to be inside a blogster root dir.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/njichev/blogster. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

