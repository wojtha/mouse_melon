module MouseMelon
  module Tools
    class SpecStepsReport

      attr_reader :feature, :result

      def initialize(feature, formatter = nil)
        @feature = feature
        feature_steps = feature_parser.parse(feature)
        defined_steps = definition_parser.parse(feature)
        @result = SpecStepsResult.new(feature_steps, defined_steps)
        @formatter = formatter || BasicReportFormatter.new
      end

      def feature_parser
        FeatureStepsParser.new
      end

      def definition_parser
        StepDefinitionsParser.new
      end

      def report
        @formatter.format(self.result)
      end
      alias :to_s :report

    end
  end
end
