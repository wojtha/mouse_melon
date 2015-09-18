module MouseMelon
  module Tools
    class StepDefinitionsParser

      def parse(string)
        @steps = find_steps(string)
        strip_end_quotes
      end

    protected

      def find_steps(string)
        string.scan(/^\s*step\s+['"](.+)['"]/).flatten
      end

      def drop_duplicate_steps
        @steps.uniq!
      end

      def strip_end_quotes
        @steps.map { |step| step.gsub(/\A["']+|["']+\z/, '') }
      end

    end
  end
end
