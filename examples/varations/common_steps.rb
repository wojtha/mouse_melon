module CommonSteps
  extend MouseMelon::DSL::StepDefinitions

  def step_can_be_included1
    puts 'INCLUDED 2'
  end

  def step_can_be_included2
    puts 'INCLUDED 2'
  end

  step 'step can be included3' do
    puts 'INCLUDED 2'
  end
end
