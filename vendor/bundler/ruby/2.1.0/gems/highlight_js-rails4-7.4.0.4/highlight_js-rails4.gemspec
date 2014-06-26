# -*- encoding: utf-8 -*-
require File.expand_path('../lib/highlight_js/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rei\nMorphemass"]
  gem.email         = ["morphemass@gmail.com"]
  gem.description   = %q{Rails pipeline wraper for highlight.js}
  gem.summary       = %q{Rails pipeline wraper for highlight.js}
  gem.homepage      = "https://github.com/os6sense/highlight_js-rails4"

  gem.add_dependency "rails", ">= 4.0.0"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "highlight_js-rails4"
  gem.require_paths = ["lib"]
  gem.version       = HighlightJs::Rails::VERSION
end
