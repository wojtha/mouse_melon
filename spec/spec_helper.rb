$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mouse_melon'

RSpec.configure do |config|
  config.include MouseMelon::DSL
end

# Add feature and scenario aliases to RSpec when we are not using Capybara
# https://github.com/jnicklas/capybara/issues/1285#issuecomment-39417736
RSpec.configure do |config|
  config.alias_example_group_to :feature, :type => :feature
  config.alias_example_to :scenario
  config.alias_example_to :xscenario, :skip => "Temporarily skipped with xscenario"
  config.alias_example_to :fscenario, :focus => true
end
