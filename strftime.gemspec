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

  ignores         = File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  s.files         = Dir['**/*','.gitignore'] - ignores
  s.test_files    = Dir['spec/**/*','features/**/*','.gitignore'] - ignores
  s.executables   = Dir['bin/*'].map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rspec', '~> 2.3.0')
  s.add_development_dependency('aruba', '~> 0.3.2')

  s.post_install_message = %{
  Thanks for installing strftime. You can use these methods to
  better understand the formats used in Date and Time strftime

  Strftime::Directive.all                #=> a full array of directives
  Strftime::Directive['%y']              #=> a Strftime::Directive with
                                         #   a key of the given argument

  Strftime::Directive.default_collection #=> standard directives
                                         #   unchanged by your code

  strfd                                  #=> shorthand to get directives
  strfd('%y')                            #=> shorthand to get details
  }
end
