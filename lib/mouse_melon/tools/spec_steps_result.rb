require 'set'

module MouseMelon
  module Tools
    class SpecStepsResult

      attr_reader :feature_steps, :defined_steps

      def initialize(feature_steps, defined_steps)
        @feature_steps = Set.new(feature_steps)
        @defined_steps = Set.new(defined_steps)
      end

      def not_implemented_steps
        feature_steps - defined_steps
      end

      def unused_steps
        defined_steps - feature_steps
      end

      def implemented_steps
        defined_steps - unused_steps
      end

    end
  end
end
