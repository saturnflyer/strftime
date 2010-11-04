# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "strftime/version"

Gem::Specification.new do |s|
  s.name        = "strftime"
  s.version     = Strftime::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jim Gay"]
  s.email       = ["jim@saturnflyer.com"]
  s.homepage    = "http://rubygems.org/gems/strftime"
  s.summary     = %q{Convenient list of strftime format directives}
  s.description = %q{Convenient list of strftime format directives}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.post_install_message = %{
  Thanks for installing strftime. You can use these methods to
  better understand the formats used in Date and Time strftime
  
  Strftime::Directives       #=> a full hash of directives
  Strftime::Directives['%y'] #=> a hash of description and 
                             #   optional example value
                             
  Strftime::Directives['y']  #=> optionally exclude the %
   
  strfd                      #=> shorthand to get directives
  strfd('y')                 #=> shorthand to get details
  }
end
