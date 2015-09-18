module MouseMelon

  class StepNotFound < StandardError
    def initialize(name)
      @method_name = name
      @step_name = name.to_s.gsub(/_/, ' ')
      super "undefined step '#{@step_name}'

Please define the step by one of the following definition:

step \"#{@step_name}\" do
end

or

def #{@method_name} do
end
"
    end
  end

  module DSL

    module StepDefinitions
      def step(name, *args, &block)
        normalized_name = name.to_s.gsub(/ /, '_')
        define_method(normalized_name, *args, &block)
      end
    end

    module ScenarioDefinitions
      def Step(name, *args)
        normalized_name =
            case name
            when Symbol
              name
            when String
              name.to_s.gsub(/ /, '_')
            else
              raise ArgumentError.new("Expects Symbol or String but #{name.inspect} was given")
            end
        raise StepNotFound.new(normalized_name) unless respond_to?(normalized_name)
        send(normalized_name, *args)
      end
      alias :Given :Step
      alias :When  :Step
      alias :Then  :Step
      alias :And   :Step
      alias :But   :Step
      alias :‣     :Step
      alias :•     :Step
    end

    def self.included(base)
      base.extend StepDefinitions
      base.include ScenarioDefinitions
    end

  end
end
