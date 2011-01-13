# strftime

It's pronounced "strftime", not "strftime".

With strftime you'll have descriptions of time format directives at your fingertips in Ruby.

`Strftime::Directive.all` contains an array of these directive objects
holding a key, description and example.

Just use `Strftime::Directives['%M']` to get a description and example, or use the shorthand method `strfd '%M'`

    Strftime::Directives['%M'].description #=> 'Minute of the hour'

This might be useful for you, or for users of a system which are able to specify string formats for dates and times.
