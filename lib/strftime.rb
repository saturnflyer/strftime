module Strftime
  Directives = Hash.new do |hash, key|
    mod = ('%' << key.to_s)
    hash[mod] if hash.keys.include?(mod)
  end
  Directives.merge!({
    '%a' => { :description => 'The abbreviated weekday name', :example => "Sun"},
    '%A' => { :description => 'The  full  weekday  name', :example => "Sunday"},
    '%b' => { :description => 'The abbreviated month name', :example => "Jan"},
    '%B' => { :description => 'The  full  month  name', :example => "January"},
    '%c' => { :description => 'The preferred local date and time representation'},
    '%C' => { :description => 'Century (20 in 2009)'},
    '%d' => { :description => 'Day of the month', :example => "01..31"},
    '%D' => { :description => 'Date (%m/%d/%y)'},
    '%e' => { :description => 'Day of the month, blank-padded', :example => "1..31"},
    '%F' => { :description => 'Equivalent to %Y-%m-%d (the ISO 8601 date format)'},
    '%h' => { :description => 'Equivalent to %b'},
    '%H' => { :description => 'Hour of the day, 24-hour clock', :example => "00..23"},
    '%I' => { :description => 'Hour of the day, 12-hour clock', :example => "01..12)"},
    '%j' => { :description => 'Day of the year', :example => "001..366"},
    '%k' => { :description => 'hour, 24-hour clock, blank-padded', :example => "0..23"},
    '%l' => { :description => 'hour, 12-hour clock, blank-padded', :example => "0..12"},
    '%L' => { :description => 'Millisecond of the second', :example => "000..999"},
    '%m' => { :description => 'Month of the year', :example => "01..12"},
    '%M' => { :description => 'Minute of the hour', :example => "00..59"},
    '%n' => { :description => 'Newline (\n)'},
    '%N' => { :description => 'Fractional seconds digits, default is 9 digits (nanosecond)
            %3N  millisecond (3 digits)
            %6N  microsecond (6 digits)
            %9N  nanosecond (9 digits)'},
    '%p' => { :description => 'Meridian indicator', :example => "(``AM''  or  ``PM'')"},
    '%P' => { :description => 'Meridian indicator', :example => "(``am''  or  ``pm'')"},
    '%r' => { :description => 'time, 12-hour', :example => "same as %I:%M:%S %p"},
    '%R' => { :description => 'time, 24-hour', :example => "%H:%M"},
    '%s' => { :description => 'Number of seconds since 1970-01-01 00:00:00 UTC.'},
    '%S' => { :description => 'Second of the minute', :example => "00..60"},
    '%t' => { :description => 'Tab character', :example => "\t"},
    '%T' => { :description => 'time, 24-hour', :example => "%H:%M:%S"},
    '%u' => { :description => 'Day of the week as a decimal, Monday being 1.', :example => "1..7"},
    '%U' => { :description => 'Week  number  of the current year,
            starting with the first Sunday as the first
            day of the first week', :example => "00..53"},
    '%v' => { :description => 'VMS date', :example => "%e-%b-%Y"},
    '%V' => { :description => 'Week number of year according to ISO 8601', :example => "01..53"},
    '%W' => { :description => 'Week  number  of the current year,
            starting with the first Monday as the first
            day of the first week', :example => "00..53"},
    '%w' => { :description => 'Day of the week', :example => "Sunday is 0, 0..6"},
    '%x' => { :description => 'Preferred representation for the date alone, no time'},
    '%X' => { :description => 'Preferred representation for the time alone, no date'},
    '%y' => { :description => 'Year without a century', :example => "00..99"},
    '%Y' => { :description => 'Year with century'},
    '%z' => { :description => 'Time zone as  hour offset from UTC (e.g. +0900)'},
    '%Z' => { :description => 'Time zone name'},
    '%%' => { :description => "Literal ``%'' character"}
  })
end

class Object
  def strfd(arg=nil)
    if arg
      Strftime::Directives[arg]
    else
      Strftime::Directives
    end
  end
end