# MouseMelon a.k.a. Mexikan Gherkin

MouseMelon is a pseudo-Gherkin DSL designed to be used in RSpec acceptance specs but it may be used elsewhere.

[![Build Status](https://travis-ci.org/wojtha/mouse_melon.svg?branch=master)](https://travis-ci.org/wojtha/mouse_melon) [![Code Climate](https://codeclimate.com/github/wojtha/mouse_melon/badges/gpa.svg)](https://codeclimate.com/github/wojtha/mouse_melon)

![Example of Gherkin feature vs MouseMelon spec](/assets/gherkin_vs_mouse_melon.png?raw=true "Gherkin vs MouseMelon")

## Notable features:

  * It runs inside RSpec (Minitest support may come later): just include module and you're ready.
  * `Given`, `When`, `Then` are just methods which calls the step definitions directly.
  * You can use symbols `I_am_registered_user` or feature steps `I am registered user`.
  * You can define the steps globally, locally or mix them into the specs.
  * Steps can have arguments `I register user`.
  * Command line tool to generate step definitions.
  * No fancy output of tested steps like Cucumber or Spinach.

### Currently supported/tested environment:

  * RSpec 3.3.x
  * Ruby 2.1.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mouse_melon'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mouse_melon

Include it to RSpec helper

```ruby
  RSpec.configure do |config|
    config.include MouseMelon::DSL, :type => :feature
  end
```

## Usage

Here is demonstration of various possible styles:

```ruby
feature 'MouseMelon features' do
  # Steps shared via modules
  include CommonSteps

  scenario 'Steps as methods' do
    given_is_defined
    when_is_defined
    then_is_defined
  end

  scenario 'Steps as symbols' do
    Given :given_is_defined
     When :when_is_defined
     Then :then_is_defined
  end

  scenario 'Steps as strings' do
    Given 'given is defined'
     When 'when is defined'
     Then 'then is defined'
      And 'and is defined'
      And 'and it has arguments', 'hello', 1
  end

  scenario 'Steps as Steps' do
    Step 'given is defined'
    Step 'when is defined'
    Step 'then is defined'
  end

  scenario 'Steps as triangle bullets' do
    ‣ 'given is defined'
    ‣ 'when is defined'
    ‣ 'then is defined'
  end

  scenario 'Steps as circle bullets' do
    • 'given is defined'
    • 'when is defined'
    • 'then is defined'
  end

  # INLINE STEP DEFINITIONS

  def given_is_defined
    puts 'GIVEN'
  end

  def when_is_defined
    puts 'WHEN'
  end

  step 'then is defined' do
    puts 'THEN'
  end

  step 'and is defined' do
    puts 'AND'
  end

  step 'and it has arguments' do |*args|
    puts "AND with args #{args.inspect}"
  end
end
```

For more examples look inside `examples` and `spec` folders.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mouse_melon. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

