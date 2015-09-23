module MouseMelon
  module Tools
    class BasicReportFormatter

      def format(report)
        @report = report
"
DEFINED:
#{defined_steps_list}

UNUSED:
#{unused_steps_list}

MISSING:

#{missing_steps_list}
"
      end

    protected

      def defined_steps_list(spaces: 2)
        prefix = " " * spaces
        @report.implemented_steps.map { |step| "#{prefix}#{step}" }.join("\n")
      end

      def unused_steps_list(spaces: 2)
        prefix = " " * spaces
        @report.unused_steps.map { |step| "#{prefix}#{step}" }.join("\n")
      end

      def missing_steps_list
        @report.not_implemented_steps.map do |name|
          body = %q{skip "‣ '%s' at line #{__FILE__}:#{__LINE__}"} % name
          StepDefinition.new(name, body: body, spaces: 2).to_s
        end.join("\n")
      end

    end
  end
end
