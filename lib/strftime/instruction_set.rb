module Strftime
  class InstructionSet
    include Strftime::DirectiveMatchers
    attr_reader :example
    attr_writer :example
    attr_reader :instructions
    attr_writer :instructions
    def initialize(given)
      self.example = given
      self.instructions = []
      test_date = given.dup
      
      # Single replacements
      test_date.gsub!(MONTHNAMES_REGEXP,'%B')
      test_date.gsub!(TIMEZONE_OFFSET_REGEXP,'%z')
      test_date.gsub!(FOUR_DIGIT_YEAR_REGEXP,'%Y')
      
      # 2 digit options
      two_digit_directives = Strftime::Directive.all.select{|d| 
        d.example.match(/^\d{2}$/) rescue false
      }
      test_date.scan(/\d\d/).each do |found|
        two_digit_directives.each do |directive|
          self.instructions << test_date.sub(Regexp.new(found),directive.key)
        end
      end
      one_character_directives = Strftime::Directive.all.select{|d| 
        d.example.match(/^[^%\W]{1}$/) rescue false
      }
      test_date.scan(/\d/).each do |found|
        one_character_directives.each do |directive|
          self.instructions << test_date.sub(Regexp.new(found),directive.key)
        end
      end
      self.instructions << test_date if self.instructions.empty?

      self.instructions.map!{|i| %{#{i} #=> #{Time.now.strftime(i)}}}
    end
    
    def to_s
      content = 'Using the current time as the formatting date:'
      self.instructions.join('
')
    end
  end
end