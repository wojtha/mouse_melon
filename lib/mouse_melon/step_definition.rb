module MouseMelon
  class StepDefinition
    attr_reader :name, :body, :spaces

    def initialize(name, body: nil, spaces: 0)
      @name, @body, @spaces = name, body, spaces
    end

    def code
      prefix = " " * @spaces
      out =  "#{prefix}step '#{name}' do\n"
      out << "#{prefix}  #{body}\n" if body
      out << "#{prefix}end\n"
    end
    alias :to_s :code
  end
end
