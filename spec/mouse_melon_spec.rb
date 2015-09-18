require_relative 'spec_helper'
require_relative 'common_steps'

describe MouseMelon do
  it 'has a version number' do
    expect(MouseMelon::VERSION).not_to be nil
  end
end

feature 'MouseMelon features' do
  include CommonSteps

  scenario 'Without gherkin' do
    given_is_defined
    when_is_defined
    then_is_defined
    and_is_defined
    step_is_defined
    step_can_have_arguments1('X')
    step_can_be_included1
  end

  scenario 'Gherkin steps as symbols' do
    Given :given_is_defined
     When :when_is_defined
     Then :then_is_defined
      And :and_is_defined
     Step :step_is_defined
      And :step_can_have_arguments2, 'Y'
      And :step_can_be_included2
  end

  scenario 'Gherkin steps as strings' do
    Given 'given is defined'
     When 'when is defined'
     Then 'then is defined'
      And 'and is defined'
     Step 'step is defined'
      And 'step can have arguments3', 'Z'
      And 'step can have "quotes"3'
      And 'step can be included3'
  end

  scenario 'Gherkin steps as triangle bullets' do
    ‣ 'given is defined'
    ‣ 'when is defined'
    ‣ 'then is defined'
  end

  scenario 'Gherkin steps as circle bullets' do
    • 'given is defined'
    • 'when is defined'
    • 'then is defined'
  end

  def given_is_defined
    puts 'GIVEN'
  end

  def when_is_defined
    puts 'WHEN'
  end

  def then_is_defined
    puts 'THEN'
  end

  def and_is_defined
    puts 'AND'
  end

  step 'step is defined' do
    puts 'STEP'
  end

  step 'step can have "quotes"3' do
    puts "QUOTES 3"
  end

  def step_can_have_arguments1(arg)
    puts "STEP #{arg}"
  end

  def step_can_have_arguments2(arg)
    puts "STEP #{arg}"
  end

  step 'step can have arguments3' do |arg|
    puts "STEP #{arg}"
  end

end
