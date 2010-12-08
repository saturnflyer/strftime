module Strftime
  class Directive
    attr_accessor :key
    attr_accessor :description
    attr_accessor :example

    @all = []

    def initialize(key, options={})
      self.key = key
      self.description = options[:description]
      self.example = options[:example]
      self.class.all << self
      self
    end
    def <=>(directive)
      key <=> directive.key
    end
    class << self
      attr_reader :all
      attr_writer :all
      attr_reader :default_collection

      def [](key)
        all.find{|d| d.key == key}
      end
    end
    @default_collection = {
      '%A' => {:description => %{English day of the week}, 
                :example => %{"Saturday"},
                :related => ['%a']},
      '%a' => {:description => %{Abbreviated English day of the week}, 
                :example => %{"Sat"},
                :related => %w{%A %d %e}},
      '%B' => {:description => %{English month of the year}, 
                :example => %{"December"},
                :related => %w{%b}},
      '%b' => {:description => %{English month of the year}, 
                :example => %{"Dec"},
                :related => %w{%B}},
      '%C' => {:description => %{The century part of the year, zero-padded if necessary.}, 
                :example => %{"20"},
                :related => %w{%y %Y}},
      '%c' => {:description => %{This prints the date and time in a way that looks like the default string representation of Time, but without the timezone. Equivalent to '%a %b %e %H:%M:%S %Y'}, 
                :example => %{"Sat Dec 31 13:22:33 2005"},
                :related => %w{%a %b %e %H %M %S %Y}},
      '%D' => {:description => %{American-style short date format with two-digit year. Equivalent to "%m/%d/%y"}, 
                :example => %{"12/31/05"},
                :related => %w{%m %d %y}},
      '%d' => {:description => %{Day of the month, zero-padded}, 
                :example => %{"31"},
                :related => %w{%e}},
      '%e' => {:description => %{Day of the month, not zero-padded}, 
                :example => %{"31"},
                :related => %w{}},
      '%F' => {:description => %{Short date format with 4-digit year.; equivalent to "%Y-%m-%d"}, 
                :example => %{"2005-12-31"},
                :related => %w{%Y %m %d %D}},
      '%G' => {:description => %{Commercial year with century, zero-padded to a minimum of four digits and with a minus sign prepended for dates BCE. For the calendar year, use %Y)}, 
                :example => %{"2005"},
                :related => %w{%g %Y %y}},
      '%g' => {:description => %{Year without century, zero-padded to two digits}, 
                :example => %{"05"},
                :related => %w{%G %Y %y}},
      '%H' => {:description => %{Hour of the day, 24-hour clock, zero-padded to two digits}, 
                :example => %{"13"},
                :related => %w{%I}},
      '%h' => {:description => %{Abbreviated month of the year; the same as "%b"}, 
                :example => %{"Dec"},
                :related => %w{}},
      '%I' => {:description => %{Hour of the day, 12-hour clock, zero-padded to two digits}, 
                :example => %{"01"},
                :related => %w{%H}},
      '%j' => {:description => %{Julian day of the year, padded to three digits (from 001 to 366)}, 
                :example => %{"365"},
                :related => %w{}},
      '%k' => {:description => %{Hour of the day, 24-hour clock, not zero-padded; like %H but with no padding}, 
                :example => %{"13"},
                :related => %w{}},
      '%l' => {:description => %{Hour of the day, 12-hour clock, not zero-padded; like %I but with no padding}, 
                :example => %{"1"},
                :related => %w{}},
      '%M' => {:description => %{Minute of the hour, padded to two digits}, 
                :example => %{"22"},
                :related => %w{}},
      '%m' => {:description => %{Month of the year, padded to two digits}, 
                :example => %{"12"},
                :related => %w{}},
      '%n' => {:description => %{A newline; don't use this; just put a newline in the formatting string}, 
                :example => %{"\n"},
                :related => %w{}},
      '%P' => {:description => %{Lowercase meridian indicator ("am" or "pm")}, 
                :example => %{"pm"},
                :related => %w{}},
      '%p' => {:description => %{Upper meridian indicator. Like %P, except gives "AM" or "PM"; yes, the uppercase P gives the lowercase meridian, and vice versa}, 
                :example => %{"PM"},
                :related => %w{}},
      '%R' => {:description => %{Short 24-hour time format; equivalent to "%H:%M"}, 
                :example => %{"13:22"},
                :related => %w{}},
      '%r' => {:description => %{Long 12-hour time format; equivalent to "%I:%M:%S %p"}, 
                :example => %{"01:22:33 PM"},
                :related => %w{}},
      '%S' => {:description => %{Second of the minute, zero-padded to two digits}, 
                :example => %{"33"},
                :related => %w{}},
      '%s' => {:description => %{Seconds since the Unix epoch}, 
                :example => %{"1136053353"},
                :related => %w{}},
      '%T' => {:description => %{Long 24-hour time format; equivalent to "%H:%M:%S"}, 
                :example => %{"13:22:33"},
                :related => %w{}},
      '%t' => {:description => %{A tab; don't use this; just put a tab in the formatting string}, 
                :example => %{"\t"},
                :related => %w{}},
      '%U' => {:description => %{Calendar week number of the year: assumes that the first week of the year starts on the first Sunday; if a date comes before the first Sunday of the year, it's counted as part of "week zero" and "00" is returned}, 
                :example => %{"52"},
                :related => %w{}},
      '%u' => {:description => %{Commercial weekday of the year, from 1 to 7, with Monday being day 1}, 
                :example => %{"6"},
                :related => %w{}},
      '%V' => {:description => %{Commercial week number of the year (see Recipe 3.11)}, 
                :example => %{"52"},
                :related => %w{}},
      '%W' => {:description => %{The same as %V, but if a date is before the first Monday of the year, it's counted as part of "week zero" and "00" is returned}, 
                :example => %{"52"},
                :related => %w{}},
      '%w' => {:description => %{Calendar day of the week, from 0 to 6, with Sunday being day 0}, 
                :example => %{"6"},
                :related => %w{}},
      '%X' => {:description => %{Preferred representation for the time; equivalent to "%H:%M:%S"}, 
                :example => %{"13:22:33"},
                :related => %w{%H %M %S}},
      '%x' => {:description => %{Preferred representation for the date; equivalent to "%m/%d/%y"}, 
                :example => %{"12/31/05"},
                :related => %w{%m %d %y}},
      '%Y' => {:description => %{Year with century, zero-padded to four digits and with a minus sign prepended for dates BCE}, 
                :example => %{"2005"},
                :related => %w{}},
      '%y' => {:description => %{Year without century, zero-padded to two digits}, 
                :example => %{"05"},
                :related => %w{}},
      '%Z' => {:description => %{The timezone abbreviation (Time) or GMT offset (Date). Date will use "Z" instead of "+0000" if a time is in GMT}, 
                :example => %{"GMT" for Time, "Z" for Date},
                :related => %w{%z}},
      '%z' => {:description => %{The timezone as a GMT offset}, 
                :example => %{"+0000"},
                :related => %w{}},
      '%%' => {:description => %{A literal percent sign}, 
                :example => %{"%"},
                :related => %w{}},
      '%v' => {:description => %{European-style date format with month abbreviation; equivalent to "%e-%b-%Y"}, 
                :example => %{31-Dec-2005},
                :related => %w{%e %b %Y}},
      '%+' => {:description => %{Prints a Dateobject as though it were a Timeobject converted to a string; like %c, but includes the timezone information; equivalent to "%a %b %e %H:%M:%S %Z %Y"}, 
                :example => %{Sat Dec 31 13:22:33 Z 2005},
                :related => %w{%a %b %e %H %M %S %Z %Y}}
    }.each do |k,v|
      new(k, v)
    end.collect
  end
end