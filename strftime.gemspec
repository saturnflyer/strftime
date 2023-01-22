# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "strftime/version"

Gem::Specification.new do |spec|
  spec.name          = "strftime"
  spec.version       = Strftime::VERSION
  spec.authors       = ["Jim Gay"]
  spec.email         = ["jim@saturnflyer.com"]

  spec.summary       = %q{Convenient list of strftime format directives}
  spec.homepage      = "https://github.com/saturnflyer/strftime"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency 'aruba'

  spec.post_install_message = %{
  Thanks for installing strftime. You can use these methods to
  better understand the formats used in Date and Time strftime

  Strftime::Directive.all                #=> a full array of directives
  Strftime::Directive['%y']              #=> a Strftime::Directive with
                                         #   a key of the given argument

  Strftime::Directive.default_collection #=> standard directives
                                         #   unchanged by your code

  strfd                                  #=> shorthand to get directives
  strfd('%y')                            #=> shorthand to get details
  strfd('April 29 2011')                 #=> a list of options for
                                         #   directives to match that date
  }
end
