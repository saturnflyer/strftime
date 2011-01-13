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
    
    Scenario: Displaying complex directives
      When I run "strfd 'February 18, 2007'"
      Then the output should contain "%B %d, %Y"
      And the exit status should be 0
      
    Scenario: Four digit year directive
      When I run "strfd '2010'"
      Then the output should contain "%Y"
      
    Scenario: Time zone offset directive
      When I run "strfd '+0000'"
      Then the output should contain "%z"
      
    Scenario: Two digit directive
      When I run "strfd '10'"
      Then the output should contain "%g"
      And the output should contain "%S"
      And the output should contain "%H"
      And the output should contain "%I"
      And the output should contain "%U"
      And the output should contain "%V"
      And the output should contain "%k"
      And the output should contain "%W"
      And the output should contain "%m"
      And the output should contain "%M"
      And the output should contain "%C"
      And the output should contain "%y"
      And the output should contain "%d"
      
    Scenario: One digit directive
      When I run "strfd '3'"
      Then the output should contain "%e"
      Then the output should contain "%l"
      Then the output should contain "%u"
      Then the output should contain "%w"