module Strftime
  module DirectiveMatchers
    MONTHNAMES_REGEXP = Regexp.new('('<<Date::MONTHNAMES.compact.join('|')<<')')
    TIMEZONE_OFFSET_REGEXP = /\+\d{4}/
    FOUR_DIGIT_YEAR_REGEXP = /\d{4}/
  end
end