Feature: using the command line
  As a command line user
  I want to see the time parsing directives for a date
  so that I may better use and understand time parsing
  
    Scenario: Displaying all options
      When I run "strfd"
      Then the output should contain "%A"
      And the output should contain "Saturday"
      And the output should contain "English day of the week"
      And the exit status should be 0
    
    Scenario: Displaying possible directives
      When I run "strfd 'February 18, 2007'"
      Then the output should contain "%B %d, %Y"
      And the exit status should be 0