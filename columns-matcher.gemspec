# -*- encoding: utf-8 -*-
require File.expand_path('../lib/columns-matcher/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrea Mostosi"]
  gem.email         = ["andrea.mostosi@zenkay.net"]
  gem.description   = %q{Given an hash of possibles header label find the correct position of a column in the real header. Useful when you don't know the structure of a spreadsheet.}
  gem.summary       = %q{Column header label matcher}
  gem.homepage      = "https://github.com/zenkay/columns-matcher"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "columns-matcher"
  gem.require_paths = ["lib"]
  gem.version       = ColumnsMatcher::VERSION
  
  gem.add_development_dependency "rspec", "~> 2.6.0"
  gem.add_development_dependency "rake", "~> 0.9.2.2"
end
