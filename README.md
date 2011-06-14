# strftime

It's pronounced "strftime", not "strftime".

With strftime you'll have descriptions of time format directives at your fingertips in Ruby.

`Strftime::Directive.all` contains an array of these directive objects
holding a key, description and example.

Just use `Strftime::Directives['%M']` to get a description and example, or use the shorthand method `strfd '%M'`

    Strftime::Directives['%M'].description #=> 'Minute of the hour'

This might be useful for you, or for users of a system which are able to specify string formats for dates and times.

## How is that useful?

You want more? You got it. With strftime you'll have `strfd` available to your in your ruby and your terminal. What's that?

By running `strfd "June 14 2011"` you'll get a list of directives that you can use to format a time and get what you want.

Other projects try to give you information about time formatting by showing you all the options upfront and allowing you to decide. strftime goes the opposite way and tries to take your desired outcome and give you want you need to format it.