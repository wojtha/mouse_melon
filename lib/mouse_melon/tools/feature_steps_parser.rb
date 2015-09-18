module MouseMelon
  module Tools
    class FeatureStepsParser

      def parse(string)
        @steps = find_steps(string)
        strip_step_arguments
        strip_end_quotes
        drop_duplicate_steps
      end

    protected

      def find_steps(string)
        string.scan(/^\s*(?:Given|When|Then|And|But|Step)\s+['"](.+)['"]$/).flatten
      end

      def drop_duplicate_steps
        @steps.uniq!
      end

      def strip_end_quotes
        @steps.map { |step| step.gsub(/\A["']+|["']+\z/, '') }
      end

      def strip_step_arguments
        @steps = @steps.map do |step|
          step.split(/['"], /).first
        end
      end

    end
  end
end
